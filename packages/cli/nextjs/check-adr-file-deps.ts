import { Args } from "https://deno.land/std/flags/mod.ts";
import { basename, extname, dirname, relative } from "https://deno.land/std/path/mod.ts";
import * as log from "https://deno.land/std/log/mod.ts";
import { getArg, runMain } from "../mod.ts";

function getFileInfo(filePath: string) {
  const filename = basename(filePath, extname(filePath));

  return {
    filename: filename,
    inAppDir: filePath.startsWith("src/app"),
    isRoute: ["route", "page"].includes(filename),
    directory: dirname(filePath),
  };
}

type DepsFile = {
  modules: Array<{
    source: string;
    dependencies: Array<{
      resolved: string;
    }>;
    dependents: string[];
  }>;
};

function findCommonRootPath(filePath1: string, filePath2: string) {
  const path1 = filePath1.split("/");
  const path2 = filePath2.split("/");

  const commonPath = [];

  for (let i = 0; i < path1.length; i++) {
    if (path1[i] === path2[i]) {
      commonPath.push(path1[i]);
    } else {
      break;
    }
  }

  return commonPath.join("/");
}

function isProperlyColocated(commonRoot: string, dependency: string) {
  const relativeDependency = relative(commonRoot, dependency);

  if (relativeDependency === '' || relativeDependency.startsWith('..')) {
    return false;
  }

  // Check if the first directory in the relative path starts with '_'
  const firstDependencyDir = relativeDependency.split('/')[0];
  return firstDependencyDir.startsWith('_');
}

async function main(args: Args) {
  const jsonFile = getArg(args, "dependency-cruiser-file");
  const dependencyData = JSON.parse(Deno.readTextFileSync(jsonFile)) as DepsFile;

  for (const module of dependencyData.modules) {
    const moduleInfo = getFileInfo(module.source);

    for (const dependency of module.dependencies) {
      const depsInfo = getFileInfo(dependency.resolved);

      if (moduleInfo.inAppDir && depsInfo.inAppDir) {
        if (moduleInfo.isRoute && depsInfo.isRoute) {
          log.error(`${module.source} imports ${dependency.resolved}`);
        }

        const commonRoot = findCommonRootPath(moduleInfo.directory, depsInfo.directory);

        if (!isProperlyColocated(commonRoot, dependency.resolved)) {
          log.error(`Route import violation: ${module.source} imports ${dependency.resolved}`);
          log.error(`  These files are not properly colocated in a common parent directory.`);
          log.error(`  Common root path: ${commonRoot}`);
        }
      }
    }
  }
}

await runMain(main);
