import { log } from "../logger/mod.ts";
import { Args, getArg, runMain } from "./mod.ts";
import { sleep } from '../clock.ts';

function getIntervalArg(args: Args) {
  const interval = getArg(args, "interval", { required: false });

  return interval ? parseInt(interval) : 1_000;
}

async function main(args: Args) {
  const url = getArg(args, "url");
  const interval = getIntervalArg(args);

  do {
    const time = new Date().toISOString();

    try {
      const resp = await fetch(url);
      log.info(`[${time}] ${url} response with ${resp.status} status code`);
    } catch (e) {
      log.error(`[${time}] ${e.message}`);
    }
    await sleep(interval);
  } while (true);
}

await runMain(main);
