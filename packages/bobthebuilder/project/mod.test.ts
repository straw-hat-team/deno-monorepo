import { OutputDir } from "./output-dir.ts";
import { Project } from "./project.ts";
import { Stub } from "../components/testings/stub.ts";
import { assertEquals, testname } from "../../../tests/bobthebuilder/mod.ts";

Deno.test(
  testname({
    given: "a project ",
    when: "running the project",
    then: "runs all the callbacks from the components",
  }),
  async () => {
    const project = new Project("test", {
      outputDir: new OutputDir("/tmp/test"),
    });
    const stub = new Stub(project, "stub1");

    await project.run();

    console.log(stub.getPreRunCalled());

    assertEquals(stub.getPreRunCalled(), true);
    assertEquals(stub.getRunCalled(), true);
    assertEquals(stub.getPostRunCalled(), true);
  },
);
