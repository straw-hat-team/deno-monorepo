import { ensureFile } from "https://deno.land/std@0.126.0/fs/mod.ts";
import {
  assert,
  assertFilesEquals,
  assertRejects,
  ensureRemovalTmpFile,
  makeTmpTestProject,
  testname,
} from "../../../tests/bobthebuilder/mod.ts";
import { File, isFile } from "./file.ts";

class EmptyContentFile extends File {
  override getFileContent() {
    return Promise.resolve(undefined);
  }
}

class HelloWorldFile extends File {
  override getFileContent() {
    return Promise.resolve("Hello, World!");
  }
}

Deno.test(
  testname({
    given: "an empty content file",
    when: "running the project",
    then: "removes the file because no content is provided",
  }),
  async () => {
    const project = makeTmpTestProject();
    const file = new EmptyContentFile(project, "empty-content-file", {
      path: "empty-content-file.txt",
    });

    await ensureFile(file.getPath());
    await project.run();

    await assertRejects(
      () => Deno.lstat(file.getPath()),
      Deno.errors.NotFound,
    );
  },
);

Deno.test(
  testname({
    given: "a hello world file",
    when: "checking if the class is a file",
    then: "returns truthy",
  }),
  () => {
    const project = makeTmpTestProject();
    const file = new HelloWorldFile(project, "hello-world", {
      path: "hello-world",
    });
    assert(isFile(file));
  },
);

Deno.test(
  testname({
    given: "a hello world file",
    when: "running the project",
    then: "adds a hello-world file with the content Hello, World!",
  }),
  async () => {
    const project = makeTmpTestProject();
    const file = new HelloWorldFile(project, "hello-world", {
      path: "hello-world",
    });

    await ensureRemovalTmpFile(file.getPath());
    await project.run();

    await assertFilesEquals("hello-world", file.getPath());
  },
);
