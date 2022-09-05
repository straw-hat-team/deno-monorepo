import { Args } from "https://deno.land/std/flags/mod.ts";
import * as path from "https://deno.land/std/path/mod.ts";
import { getArg, runMain } from "../mod.ts";
import { join } from "https://deno.land/std/path/mod.ts";

export async function* walkRoutes(thePath: string): AsyncIterable<string> {
  try {
    for await (const dirEntry of Deno.readDir(thePath)) {
      const filePath = join(thePath, dirEntry.name);
      yield filePath;
      const subRoutes = join(thePath, dirEntry.name, "routes");
      yield* walkRoutes(subRoutes);
    }
  } catch (err) {
    if (err instanceof Deno.errors.NotFound) {
      return;
    }
    throw err;
  }
}

async function main(args: Args) {
  const projectDir = getArg(args, "project-dir");
  const routesDir = path.join(projectDir, "src", "routes");

  for await (const page of walkRoutes(routesDir)) {
    const parsedPath = path.parse(path.relative(routesDir, page));

    console.log(
      path.join(
        parsedPath.dir.replaceAll("routes/", "/"),
        parsedPath.name + ".ts",
      ),
    );
  }
}

await runMain(main);
