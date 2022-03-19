import { assertEquals } from "../../deps/asserts.ts";
import { parse as parseYaml } from "../../deps/yaml.ts";
import { fromFileUrl, join } from "../../deps/path.ts";

const fixturesDirPath = join(fromFileUrl(import.meta.url), "..", "fixtures");

for await (const dirEntry of Deno.readDir(fixturesDirPath)) {
  const isYaml = dirEntry.name.endsWith(".yaml");

  if (!isYaml) {
    continue;
  }

  Deno.test({
    ignore: true,
    name: `${dirEntry.name} fixture`,
    async fn() {
      const fixtureText = await Deno.readTextFile(
        join(fixturesDirPath, dirEntry.name),
      );
      const testCase = await import(
        join(fixturesDirPath, dirEntry.name.replace(".yaml", ".ts"))
        );
      const actual = parseYaml(fixtureText);
      const expected = testCase.default();

      assertEquals(expected.toJSON(), actual);
    },
  })
}
