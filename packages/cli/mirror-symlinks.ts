import * as path from "https://deno.land/std/path/mod.ts";
import { log } from "../logger/mod.ts";
import { Args, getArg, runMain } from "./mod.ts";
import { walkDir } from "../fs/mod.ts";

/**
 * This script is used to create symlinks for all the files in the given directory
 * to the given destination directory following the same directory structure.
 */
async function main(args: Args) {
  const fromDir = getArg(args, "from-dir");
  const toDir = getArg(args, "to-dir");
  const autoConfirm = getArg(args, "auto-confirm", { required: false }) ?? false;

  for await (const filePath of walkDir(fromDir)) {
    const parsedFilePath = path.parse(filePath);

    if (parsedFilePath.ext !== ".symlink") {
      continue;
    }

    const destDirPath = parsedFilePath.dir.replace(fromDir, toDir);
    const destFilePath = path.join(destDirPath, parsedFilePath.name);

    log.info(`Creating symlink from ${filePath} to ${destFilePath}`);

    const pid = Deno.run({
      cmd: [
        "ln",
        "-f",
        destFilePath,
      ],
    });

    await pid.status();
  }
}

await runMain(main);
