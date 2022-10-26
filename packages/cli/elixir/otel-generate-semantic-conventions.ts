import * as path from "https://deno.land/std/path/mod.ts";
import { parse } from 'https://deno.land/std/encoding/yaml.ts';
import { Args, getArg, runMain } from "../mod.ts";

type GitHubClient = (url: string) => Promise<Response>;

type SemanticConventionFile = {
  groups: Array<{
    id: string;
    attributes: Array<{
      id: string;
      brief?: string;
      note?: string;
      ref?: string;
    }>;
  }>
}

class SourceCode {
  #lines = new Array<string>();

  addLine(line: string) {
    this.#lines.push(line);
    return this;
  }

  addLineIf(condition: boolean, line: string) {
    return condition ? this.addLine(line) : this;
  }

  addEmptyLine() {
    return this.addLine('');
  }

  toString() {
    return this.#lines.join('\n');
  }

  toFile(path: string) {
    return Deno.writeTextFile(path, this.toString());
  }
}

function createGithubClient(githubToken: string): GitHubClient {
  return (url: string) => {
    return fetch(url, {
      headers: {
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': `Bearer ${githubToken}`
      }
    })
  }
}

async function* fetchAllFilesFromGitHub(githubClient: GitHubClient, thePath: string): AsyncIterable<{ downloadUrl: string, path: string, name: string }> {
  const files = await githubClient(thePath).then(resp => resp.json());

  for (const dirEntry of files) {
    if (dirEntry.type === 'dir') {
      yield* fetchAllFilesFromGitHub(githubClient, dirEntry.url);
    } else if (dirEntry.type === 'file') {
      yield { downloadUrl: dirEntry.download_url, path: dirEntry.path, name: dirEntry.name };
    }
  }
}

function fetchFileContentFromGitHub(githubClient: GitHubClient, thePath: string): Promise<string> {
  return githubClient(thePath).then(resp => resp.text());
}

async function main(args: Args) {
  const githubToken = getArg(args, "github-token");
  const githubDir = getArg(args, "github-contents-dir-url", { required: false }) ?? 'https://api.github.com/repos/open-telemetry/opentelemetry-specification/contents/semantic_conventions';
  const outputDir = getArg(args, "output-dir");

  const githubClient = createGithubClient(githubToken);
  const erlCode = new SourceCode();
  const elixirCode = new SourceCode();

  elixirCode.addLine(`defmodule OpenTelemetry.SemanticConventions do`);

  for await (const entry of fetchAllFilesFromGitHub(githubClient, githubDir)) {
    const content = await fetchFileContentFromGitHub(githubClient, entry.downloadUrl);

    if (!entry.name.includes('.yaml')) {
      continue
    }

    const data = parse(content) as SemanticConventionFile;

    data.groups.forEach((group) => {
      group.attributes?.forEach((attribute) => {
        const attrId = attribute.id || attribute.ref;
        const namespace = [group.id, attrId].join('.');
        const docs = (attribute.brief || attribute.note)?.replaceAll('\n', ' ').trim()
        const keyName = namespace.replaceAll('.', '_').replaceAll('-', '_')
        const erlKeyName = keyName.toUpperCase()
        const elixirKeyName = keyName.toLowerCase()

        erlCode
          .addLineIf(Boolean(docs), `%% ${docs}.`)
          .addLine(`-define(${erlKeyName}, <<"${namespace}">>).`)
          .addEmptyLine();

        elixirCode
          .addLineIf(Boolean(docs), `  @doc ~S"""`)
          .addLineIf(Boolean(docs), `  ${docs}`)
          .addLineIf(Boolean(docs), `  """`)
          .addLine(`  defmacro ${elixirKeyName} do`)
          .addLine(`    quote do: "${namespace}"`)
          .addLine(`  end`)
          .addEmptyLine();
      });
    })
  }

  elixirCode.addLine(`end`);

  await erlCode.toFile(path.join(outputDir, 'semantic_conventions.hrl'));
  await elixirCode.toFile(path.join(outputDir, 'semantic_conventions.ex'));
}

await runMain(main);
