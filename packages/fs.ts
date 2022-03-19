import { join } from "https://deno.land/std/path/mod.ts";

export async function* walkDir(thePath: string): AsyncIterable<string> {
  for await (const dirEntry of Deno.readDir(thePath)) {
    const filePath = join(thePath, dirEntry.name);

    if (dirEntry.isDirectory) {
      yield* walkDir(filePath);
    } else if (dirEntry.isFile) {
      yield filePath;
    }
  }
}
