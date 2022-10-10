import { Args, runMain } from "../mod.ts";
import { fetchEnv } from "../../system/environment.ts";

/**
 * Add the Oban Hex repository to the local Hex configuration.
 * @param _args
 */
async function main(_args: Args) {
  const fingerprint = fetchEnv("SHT_OBAN_KEY_FINGERPRINT");
  const authKey = fetchEnv("SHT_OBAN_LICENSE_KEY");
  const process = Deno.run({
    cmd: [
      "mix",
      "hex.repo",
      "add",
      "oban",
      "https://getoban.pro/repo",
      "--fetch-public-key",
      fingerprint,
      "--auth-key",
      authKey,
    ],
  });
  const status = await process.status();
  return status.code;
}

await runMain(main);
