import {
  assertFilesEquals,
  makeTmpTestProject,
  testname,
} from "../../../../tests/bobthebuilder/mod.ts";
import { GitAttributesFile } from "./git-attributes-file.ts";

Deno.test(
  testname({
    given: "a git attributes file",
    when: "running the project",
    then: "creates a .gitattributes file with the correct content",
  }),
  async () => {
    const project = makeTmpTestProject();
    const file = new GitAttributesFile(project, "hello-world");

    file
      .addAttributes(".yarn/**", "linguist-vendored")
      .addAttributes(".pnp.cjs", "linguist-generated")
      .addAttributes(".pnp.cjs", "linguist-generated")
      .addAttributes(".pnp.loader.mjs", "linguist-generated")
      .addAttributes(".yarn/releases/**", "binary")
      .addAttributes(".yarn/plugins/**", "binary");

    await project.run();

    await assertFilesEquals(".gitattributes", file.getPath());
  },
);
