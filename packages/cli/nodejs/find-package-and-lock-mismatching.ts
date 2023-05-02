import * as path from "https://deno.land/std/path/mod.ts";
import { log } from "../../logger/mod.ts";
import { Args, getArg, runMain } from "../mod.ts";

type Scope = "dependencies" | "devDependencies" | "peerDependencies";

type PackageJson = {
  dependencies?: Record<string, string>;
  devDependencies?: Record<string, string>;
  peerDependencies?: Record<string, string>;
};

type NpmList = {
  name: string;
  dependencies: Record<string, {
    version: string;
    resolved: string;
    overridden: string;
  }>;
};

/**
 * This script checks the package.json file and the package-lock.json file to make sure
 * that the versions of the dependencies match.
 */
async function main(args: Args) {
  const packageFile = getArg(args, "package-json-file");
  const module = await import(packageFile, {
    assert: { type: "json" },
  });

  log.info(`Checking ${packageFile}`);

  const pid = Deno.run({
    cwd: path.parse(packageFile).dir,
    cmd: [
      "npm",
      "list",
      "--json",
    ],
    stdout: "piped",
  });

  const output = await pid.output();
  const npmList = JSON.parse(new TextDecoder().decode(output)) as NpmList;

  ["dependencies", "devDependencies", "peerDependencies"].forEach(
    checkDependencies(module.default, npmList),
  );
}

function checkDependencies(packageJson: PackageJson, npmList: NpmList) {
  return (scope: Scope) => {
    if (packageJson[scope]) {
      Object.entries(packageJson[scope]).forEach(
        printMismatchFor(npmList, scope),
      );
    }
  };
}

function printMismatchFor(npmList: NpmList, scope: Scope) {
  return ([pkgName, currentVersion]: [string, string]) => {
    const expectedVersion = npmList.dependencies[pkgName].version;

    if (currentVersion !== expectedVersion) {
      log.error([
        `package ${pkgName} under ${scope} does not match`,
        `expected "${expectedVersion}" but got ${currentVersion}`,
      ].join("\n"));
    }
  };
}

await runMain(main);
