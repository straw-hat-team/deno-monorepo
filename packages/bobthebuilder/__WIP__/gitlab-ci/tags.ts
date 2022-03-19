import { IJsonMarshaler } from "../resource.ts";

export type Tag = string;

class Tags implements IJsonMarshaler {
  #value: Set<Tag>;

  constructor(tags?: Tag[]) {
    this.#value = new Set(tags);
  }

  toJSON() {
    if (this.#value.size === 0) {
      return undefined;
    }
    return Array.from(this.#value);
  }
}

export { Tags };
