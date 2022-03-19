import { isAbsolute, join } from "https://deno.land/std@0.109.0/path/mod.ts";
import { AbsolutePath } from "./types.ts";

export class OutputDir {
  readonly #path: AbsolutePath;

  constructor(public dir: AbsolutePath) {
    if (!isAbsolute(dir)) {
      throw new Error("The directory path is not an absolute path");
    }

    this.#path = dir;
  }

  getPath() {
    return this.#path;
  }

  joinPath(...paths: string[]) {
    return join(this.#path, ...paths);
  }
}
