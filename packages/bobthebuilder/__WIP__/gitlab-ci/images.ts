import { IJsonMarshaler } from "../resource.ts";
import { Commands, Script } from "./script.ts";

class ImageName implements IJsonMarshaler {
  readonly #name: string;

  constructor(name: string) {
    if (!name || name.length === 0) {
      throw new Error("Image name is required and can not be empty");
    }
    this.#name = name;
  }

  get name(): string {
    return this.#name;
  }

  toJSON() {
    return this.name;
  }
}

class Image implements IJsonMarshaler {
  readonly #name: ImageName;
  readonly #entrypoint: Script;

  constructor(opts: {
    name: string;
    entrypoint?: Commands[];
  }) {
    this.#name = new ImageName(opts.name);
    this.#entrypoint = new Script(opts.entrypoint);
  }

  toJSON() {
    return this.#entrypoint.hasAnyCommand()
      ? { name: this.#name.toJSON(), entrypoint: this.#entrypoint.toJSON() }
      : this.#name.toJSON();
  }
}

export { Image };
