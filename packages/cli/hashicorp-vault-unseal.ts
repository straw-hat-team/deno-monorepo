import { Args, getArg, runMain } from "./mod.ts";

async function main(args: Args) {
  const context = getArg(args, "context", { required: false }) ??
    "docker-desktop";
  const namespace = getArg(args, "namespace", { required: false }) ??
    "platform";
  const instances = parseInt(getArg(args, "instances"));
  const keys = Array.from(getArg(args, "key"));

  if (keys.length === 0) {
    throw new Error("No keys provided");
  }

  for (let i = 0; i < instances; i++) {
    for (const key of keys) {
      await Deno.run({
        cmd: [
          "kubectl",
          "exec",
          `--context=${context}`,
          `--namespace=${namespace}`,
          "--stdin=true",
          "--tty=true",
          `vault-${i}`,
          "--",
          "vault",
          "operator",
          "unseal",
          key,
        ],
      }).status();
    }
  }
}

await runMain(main);
