export * from "https://deno.land/std@0.126.0/testing/asserts.ts";

import { fromFileUrl, join } from "https://deno.land/std@0.126.0/path/mod.ts";
import { assertEquals } from "https://deno.land/std@0.126.0/testing/asserts.ts";
import { OutputDir } from "../../packages/bobthebuilder/project/output-dir.ts";
import { Project } from "../../packages/bobthebuilder/project/project.ts";
import { maybeRemove } from "../../packages/bobthebuilder/helpers.ts";

export const FIXTURES_DIR = join(
  fromFileUrl(import.meta.url),
  "..",
  "fixtures",
);

export const TMP_DIR = join(
  fromFileUrl(import.meta.url),
  "..",
  "tmp",
);

export const TMP_OUTPUT_DIR = new OutputDir(TMP_DIR);

export function makeTmpTestProject() {
  return new Project("test", { outputDir: TMP_OUTPUT_DIR });
}

export function testname(opts: { given: string; when: string; then: string }) {
  return `given ${opts.given} when ${opts.when} then ${opts.then}`;
}

export function ensureRemovalTmpFile(...paths: string[]) {
  return maybeRemove(join(TMP_DIR, ...paths));
}

export async function assertFilesEquals(
  expectedPath: string,
  actualPath: string,
) {
  const expectedContent = await Deno.readTextFile(
    join(FIXTURES_DIR, expectedPath),
  );
  const actualContent = await Deno.readTextFile(actualPath);
  assertEquals(expectedContent, actualContent);
}
