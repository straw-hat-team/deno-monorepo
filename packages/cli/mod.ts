import { Args, parse } from "https://deno.land/std/flags/mod.ts";
import { onFailure } from "../logger.ts";

export type { Args };

export function getArg(
  command: unknown,
  argName: string,
  opts?: { required?: boolean },
) {
  const value = command[argName];
  const required = opts?.required ?? true;

  if (!value && required) {
    throw new Error(`Missing argument ${argName}`);
  }

  return value;
}

export function runMain(callback: (args: Args) => Promise<unknown>) {
  return callback(parse(Deno.args)).catch(onFailure);
}
