import { IJsonMarshaler } from "../resource.ts";

class Stages implements IJsonMarshaler {
  #value = new Map<string, Stage>();

  constructor(stages?: Stage[]) {
    stages?.forEach((stage) => this.#maybeSet(stage));
  }

  #maybeSet(value: Stage) {
    if (this.#value.has(value.name)) {
      throw new Error(`Stage "${value.name}" is already exists`);
    }
    this.#value.set(value.name, value);
  }

  toJSON() {
    if (this.#value.size === 0) {
      return undefined;
    }
    return Array.from(this.#value.values()).map((stage) => stage.toJSON());
  }
}

class Stage implements IJsonMarshaler {
  readonly name: string;

  constructor(opts: { name: string }) {
    this.name = opts.name;
  }

  toJSON() {
    return this.name;
  }
}

export { Stage, Stages };
