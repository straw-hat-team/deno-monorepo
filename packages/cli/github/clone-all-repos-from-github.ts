import { log } from "../../logger/mod.ts";
import { Args, getArg, runMain } from "../mod.ts";

async function getOrgRepos(
  command: { githubToken: string; githubOrg: string },
) {
  const response = await fetch(
    `https://api.github.com/orgs/${command.githubOrg}/repos`,
    {
      headers: {
        Authorization: `token ${command.githubToken}`,
      },
    },
  );

  if (!response.ok) {
    throw new Error(`${response.status} ${response.statusText}`);
  }

  return response.json();
}

async function main(args: Args) {
  const githubToken = getArg(args, "github-token");
  const githubOrg = getArg(args, "github-org");
  const outputDir = getArg(args, "output-dir");

  const repos = await getOrgRepos({
    githubToken: githubToken,
    githubOrg: githubOrg,
  });

  log.info(
    `Cloning https://github.com/orgs/${githubOrg} repos into ${outputDir} directory`,
  );

  const tasks = repos.map(async (repo: { clone_url: string }) => {
    const process = Deno.run({
      cmd: ["git", "clone", repo.clone_url],
      cwd: outputDir,
    });
    await process.status();
  });

  return Promise.all(tasks);
}

await runMain(main);
