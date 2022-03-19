import { IJsonMarshaler, IShellMarshaler } from "../resource.ts";

type VariableValue = string | Variable | EnvironmentVariable;

const NAME_REGEX = new RegExp(/^[a-zA-Z][a-zA-Z0-9_]*$/);

class EnvironmentVariable implements IJsonMarshaler, IShellMarshaler {
  readonly #name: string;

  constructor(opts: { name: string }) {
    if (!NAME_REGEX.test(opts.name)) {
      throw new Error(
        `The Name is invalid: ${opts.name}. Variable name must start with a letter, followed by any number of letters, numbers, or underscores.`,
      );
    }

    this.#name = opts.name;
  }

  get name(): string {
    return this.#name;
  }

  toShell() {
    return `$${this.#name}`;
  }

  toJSON() {
    return this.toShell();
  }
}

class Variable implements IJsonMarshaler, IShellMarshaler {
  readonly #name: string;
  readonly #value: VariableValue;

  constructor(opts: { name: string; value: VariableValue }) {
    if (opts.name.length === 0) {
      throw new Error("The Name is can not be empty");
    }

    if (!NAME_REGEX.test(opts.name)) {
      throw new Error(
        `The Name is invalid: ${opts.name}. Variable name must start with a letter, followed by any number of letters, numbers, or underscores.`,
      );
    }

    this.#name = opts.name;
    this.#value = opts.value;
  }

  get value() {
    return this.#value;
  }

  get name() {
    return this.#name;
  }

  toShell(): string {
    return `$${this.#name}`;
  }

  toJSON() {
    if (this.#value instanceof Variable) {
      return [this.#name, this.#value.toShell()];
    } else if (this.#value instanceof EnvironmentVariable) {
      return [this.#name, this.#value.toJSON()];
    } else {
      return [this.#name, this.#value];
    }
  }
}

class Variables implements IJsonMarshaler {
  #value = new Map<string, Variable>();

  constructor(variables?: Variable[]) {
    variables?.forEach((variable) => this.#maybeAdd(variable));
  }

  #maybeAdd(value: Variable) {
    if (this.#value.has(value.name)) {
      throw new Error(`Variable "${value.name}" is already exists`);
    }
    this.#value.set(value.name, value);
  }

  toJSON() {
    if (this.#value.size === 0) {
      return undefined;
    }
    const entries = Array.from(this.#value.values()).map((v) => v.toJSON());
    return Object.fromEntries(entries);
  }
}

export { EnvironmentVariable, Variable, Variables };
