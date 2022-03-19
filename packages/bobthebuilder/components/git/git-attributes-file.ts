import type { NodeId } from "../../project/mod.ts";
import type { WithDirectoryOption } from "../file.ts";
import { File, getWithDirectoryFilePath } from "../file.ts";
import { Project } from "../../project/mod.ts";

export type GitAttributesFileOptions = WithDirectoryOption<undefined>;

const FILE_NAME = ".gitattributes";

export class GitAttributesFile extends File {
  readonly #attributes = new Map<string, Set<string>>();

  constructor(project: Project, id: NodeId, opts?: GitAttributesFileOptions) {
    super(project, id, {
      path: getWithDirectoryFilePath(FILE_NAME, opts),
      readonly: true,
    });
  }

  addAttributes(glob: string, ...attributes: string[]) {
    const set = this.#getOrSet(glob);
    for (const attribute of attributes) {
      set.add(attribute);
    }
    return this;
  }

  #getOrSet(glob: string) {
    if (!this.#attributes.has(glob)) {
      this.#attributes.set(glob, new Set());
    }
    return this.#attributes.get(glob)!;
  }

  override getFileContent() {
    const entries = Array.from(this.#attributes.entries()).sort(([l], [r]) =>
      l.localeCompare(r)
    );

    if (entries.length === 0) {
      return undefined;
    }

    return entries.map(([name, attributes]) =>
      `${name} ${Array.from(attributes).join(" ")}`
    ).join("\n");
  }
}
