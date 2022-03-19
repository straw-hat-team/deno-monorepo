import * as path from "https://deno.land/std/path/mod.ts";
import { log } from "../../logger.ts";
import { Args, getArg, runMain } from "../mod.ts";

async function main(args: Args) {
  const directory = getArg(args, "directory");
  const branchName = getArg(args, "branch-name");

  for await (const dirEntry of Deno.readDir(directory)) {
    if (!dirEntry.isDirectory) {
      continue;
    }

    const cwd = path.join(directory, dirEntry.name);

    log.info(`Branching ${cwd} directory to ${branchName}`);

    const process = Deno.run({
      cmd: ["git", "checkout", "-b", branchName],
      cwd: cwd,
    });
    await process.status();
  }
}

await runMain(main);
