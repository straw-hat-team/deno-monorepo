import {
  assertFilesEquals,
  makeTmpTestProject,
  testname,
} from "../../../../tests/bobthebuilder/mod.ts";
import { GitIgnoreFile } from "./git-ignore-file.ts";

Deno.test(
  testname({
    given: "a git ignore file",
    when: "running the project",
    then: "creates a .gitignore file with the correct content",
  }),
  async () => {
    const project = makeTmpTestProject();
    const file = new GitIgnoreFile(project, "hello-world");

    file.addPatterns(
      "# The directory Mix will write compiled artifacts to.",
      "/_build/",
      "/cover/",
      "/deps/",
      "/doc/",
      "/.fetch",
      "erl_crash.dump",
      "*.ez",
      "one_piece_commanded-*.tar",
      "/tmp",
      "/priv/plts/*.plt",
      "/priv/plts/*.plt.hash",
      "!.tool-versions",
    );

    await project.run();

    await assertFilesEquals(".gitignore", file.getPath());
  },
);
