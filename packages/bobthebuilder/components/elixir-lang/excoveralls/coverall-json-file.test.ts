import {
  assertFilesEquals,
  makeTmpTestProject,
  testname,
} from "../../../../../tests/bobthebuilder/mod.ts";
import { CoverallsJsonFile } from "./coveralls-json-file.ts";

Deno.test(
  testname({
    given: "a coverall json file",
    when: "running the project",
    then: "creates a coverall.json file with the correct content",
  }),
  async () => {
    const project = makeTmpTestProject();
    const file = new CoverallsJsonFile(project, "hello-world", {
      config: {
        coverage_options: {
          treat_no_relevant_lines_as_covered: true,
        },
      },
    });

    await project.run();

    await assertFilesEquals("coveralls.json", file.getPath());
  },
);
