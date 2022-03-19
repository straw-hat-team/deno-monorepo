import { join } from "https://deno.land/std@0.126.0/path/mod.ts";
import { Component, NodeId, Project, RelativePath } from "../project/mod.ts";
import { maybeChmod, maybeRemove } from "../helpers.ts";

type FileContent = string | undefined;

export type WithDirectoryOption<T> = T & {
  directory?: RelativePath;
};

export type FileOptions = {
  readonly path: string;
  readonly readonly?: boolean;
  readonly executable?: boolean;
};

export abstract class File extends Component {
  readonly #executable: boolean;
  readonly #readonly: boolean;
  readonly #path: string;

  constructor(project: Project, id: NodeId, opts: FileOptions) {
    super(project, id);
    this.#path = opts.path;
    this.#executable = opts.executable ?? false;
    this.#readonly = opts.readonly ?? false;
  }

  abstract getFileContent(): Promise<FileContent> | FileContent;

  getPath() {
    return this.getProject().getOutputDir().joinPath(this.#path);
  }

  override async run() {
    const filePath = this.getPath();
    const content = await this.getFileContent();

    if (content === undefined) {
      return maybeRemove(filePath);
    }

    await maybeChmod(filePath, 0o600);
    await Deno.writeTextFile(filePath, content);
    await Deno.chmod(
      filePath,
      getFilePermissions(this.#readonly, this.#executable),
    );
  }
}

export function isFile(c: Component): c is File {
  return c instanceof File;
}

export function getWithDirectoryFilePath(
  fileName: string,
  opts?: WithDirectoryOption<unknown>,
): string {
  return opts?.directory ? join(opts.directory, fileName) : fileName;
}

function getFilePermissions(readonly: boolean, executable: boolean) {
  if (readonly && executable) {
    return 0o500;
  } else if (readonly) {
    return 0o400;
  } else if (executable) {
    return 0o755;
  } else {
    return 0o644;
  }
}
