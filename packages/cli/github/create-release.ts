import { jsonStringify, log } from "../../logger/mod.ts";
import { Args, getArg, runMain } from "../mod.ts";
import { executeRequest } from "./mod.ts";

async function main(args: Args) {
  const githubToken = getArg(args, "github-token");
  const githubOrg = getArg(args, "github-org");
  const githubRepo = getArg(args, "github-repo");
  const tagName = getArg(args, "tag-name");

  const response = await executeRequest<{ html_url: string; id: string }>({
    method: "POST",
    url: "/repos/{owner}/{repo}/releases",
    token: githubToken,
    params: {
      path: {
        owner: githubOrg,
        repo: githubRepo,
      },
      body: {
        tag_name: tagName,
      },
    },
  });

  log.info(
    `release created ${
      jsonStringify({
        tagName,
        id: response.id,
        repo: `${githubOrg}/${githubRepo}`,
        url: response.html_url,
      })
    }`,
  );
}

await runMain(main);
