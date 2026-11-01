import { log } from "../../logger/mod.ts";
import { Args, getArg, runMain } from "../mod.ts";
import { executeRequest } from "./mod.ts";

async function main(args: Args) {
  const githubToken = getArg(args, "github-token");
  const githubOrg = getArg(args, "github-org");
  const outputDir = getArg(args, "output-dir");

  const response = await executeRequest<Array<{ clone_url: string }>>({
    method: "GET",
    url: "/orgs/{owner}/repos",
    token: githubToken,
    params: {
      path: {
        owner: githubOrg,
      },
    },
  });

  log.info(
    `cloning https://github.com/orgs/${githubOrg} repos into ${outputDir} directory`,
  );

  const tasks = response.map(async (repo) => {
    const command = new Deno.Command("git", {
      args: ["clone", repo.clone_url],
      cwd: outputDir,
    });
    await command.spawn().status;
  });

  return Promise.all(tasks);
}

await runMain(main);
