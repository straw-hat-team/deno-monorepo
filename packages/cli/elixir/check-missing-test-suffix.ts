import * as path from "https://deno.land/std/path/mod.ts";
import { log } from "../../logger/mod.ts";
import { Args, getArg, runMain } from "../mod.ts";
import { walkDir } from '../../fs/mod.ts';

const ignoredFiles = ['.DS_Store'];

function isIgnoredFile(file: string) {
  for (const ignoredFilesKey in ignoredFiles) {
    if (file.endsWith(ignoredFiles[ignoredFilesKey])) {
      return true;
    }
  }

  return false;
}

async function main(args: Args) {
  const directory = getArg(args, "directory");

  for await (const file of walkDir(directory)) {
    if (isIgnoredFile(file)) {
      continue;
    }

    if (file.endsWith('_test.exs')) {
      continue;
    }

    log.error(`Missing _test.exs suffix: ${file}`);
  }
}

await runMain(main);
