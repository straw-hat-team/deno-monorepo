import * as log from "https://deno.land/std/log/mod.ts";

export { log };

export function onFailure(e: Error) {
  log.error(e);
  Deno.exit(1);
}
