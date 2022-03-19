import type { NodeId } from "../../project/mod.ts";
import type { WithDirectoryOption } from "../file.ts";
import { File, getWithDirectoryFilePath } from "../file.ts";
import { Project } from "../../project/mod.ts";

export type GitIgnoreFileOptions = WithDirectoryOption<unknown>;

const FILE_NAME = ".gitignore";

export class GitIgnoreFile extends File {
  readonly #patterns = new Set<string>();

  constructor(project: Project, id: NodeId, opts?: GitIgnoreFileOptions) {
    super(project, id, {
      path: getWithDirectoryFilePath(FILE_NAME, opts),
      readonly: true,
    });
  }

  public addPatterns(...patterns: string[]) {
    for (const pattern of patterns) {
      // skip comments
      if (pattern.startsWith("#")) {
        continue;
      }

      this.#patterns.add(pattern);
    }
  }

  override getFileContent() {
    if (this.#patterns.size === 0) {
      return undefined;
    }

    return Array.from(this.#patterns).join("\n");
  }
}
