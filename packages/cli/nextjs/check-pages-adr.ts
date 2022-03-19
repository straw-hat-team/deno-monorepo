import { Args } from "https://deno.land/std/flags/mod.ts";
import * as path from "https://deno.land/std/path/mod.ts";
import * as log from "https://deno.land/std/log/mod.ts";
import { ensureFile } from "https://deno.land/std@0.116.0/fs/mod.ts";
import { getArg, runMain } from "../mod.ts";
import { walkDir } from "../../fs/mod.ts";

const RESERVED_PAGES = ["_document.tsx", "_app.tsx", "_error.tsx"];

async function checkReservedRoute(
  projectDir: string,
  reservedPage: path.ParsedPath,
) {
  const fileName = reservedPage.name.replace("_", "") + ".tsx";
  const thePath = path.join(projectDir, "src", fileName);

  try {
    await ensureFile(thePath);
  } catch (_) {
    log.error(thePath);
  }
}

function getFileName(parsedPath: path.ParsedPath) {
  const routesPath = parsedPath.dir.split("/").join("/routes/");

  if (parsedPath.dir === "") {
    return path.join(routesPath, parsedPath.name, "index.tsx");
  }

  return parsedPath.base === "index.tsx"
    ? path.join(routesPath, "index.tsx")
    : path.join(routesPath, "routes", parsedPath.name, "index.tsx");
}

async function checkRoute(projectDir: string, parsedPath: path.ParsedPath) {
  const routesDir = path.join(projectDir, "src", "routes");
  const fileName = getFileName(parsedPath);
  const thePath = path.join(routesDir, fileName);

  try {
    await ensureFile(thePath);
  } catch (_) {
    log.error(thePath);
  }
}

async function main(args: Args) {
  const projectDir = getArg(args, "project-dir");
  const pagesDir = path.join(projectDir, "src", "pages");

  for await (const page of walkDir(pagesDir)) {
    const parsedPath = path.parse(path.relative(pagesDir, page));

    if (RESERVED_PAGES.includes(parsedPath.base)) {
      await checkReservedRoute(projectDir, parsedPath);
    } else {
      await checkRoute(projectDir, parsedPath);
    }
  }
}

await runMain(main);
