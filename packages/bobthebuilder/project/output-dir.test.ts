import { OutputDir } from "./output-dir.ts";
import { assertThrows, testname } from "../../../tests/bobthebuilder/mod.ts";

Deno.test(
  testname({
    given: "output dir",
    when: "creating an output directory with a relative path",
    then: "fails",
  }),
  () => {
    assertThrows(
      () => {
        new OutputDir("./tmp/test");
      },
      Error,
      "The directory path is not an absolute path",
    );
  },
);

Deno.test(
  testname({
    given: "output dir",
    when: "joining the path",
    then: "returns the joined path",
  }),
  () => {
    const outDir = new OutputDir("/home/user");
    console.assert(outDir.joinPath("test", "2") === "/home/user/test/2");
  },
);
