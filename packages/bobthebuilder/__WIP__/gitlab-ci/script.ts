import { IJsonMarshaler } from "../resource.ts";

class Command implements IJsonMarshaler {
  readonly #code: string;

  constructor(code: string) {
    if (code.length === 0) {
      throw new Error(
        "script is required and can not be empty array or empty string",
      );
    }
    this.#code = code;
  }

  toJSON() {
    return this.#code;
  }
}

type Commands = Command[] | Command;

class Script implements IJsonMarshaler {
  readonly #commands?: Array<Commands>;

  constructor(commands?: Array<Commands>) {
    if (commands?.length === 0) {
      throw new Error("The script must contain at least one command");
    }

    // TODO: Asses if using commands.flat() is better
    this.#commands = commands;
  }

  hasAnyCommand() {
    return this.#commands !== undefined && this.#commands.length !== 0;
  }

  toJSON() {
    return this.#commands?.map((command) => {
      if (command instanceof Command) {
        return command.toJSON();
      } else {
        return command.map((cmd) => cmd.toJSON());
      }
    });
  }
}

export type { Commands };
export { Command, Script };
