import { Args, getArg, runMain } from "../../mod.ts";

async function main(args: Args) {
  const context = getArg(args, "context", { required: false }) ??
    "docker-desktop";
  const namespace = getArg(args, "namespace", { required: false }) ??
    "platform";

  await Deno.run({
    cmd: [
      "kubectl",
      "exec",
      `--context=${context}`,
      `--namespace=${namespace}`,
      "--stdin=true",
      "--tty=true",
      `vault-0`,
      "--",
      "vault",
      "operator",
      "init",
    ],
  }).status();
}

await runMain(main);
