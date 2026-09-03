import { Args, getArg, runMain } from "../../mod.ts";

async function main(args: Args) {
  const context = getArg(args, "context", { required: false }) ??
    "docker-desktop";
  const namespace = getArg(args, "namespace", { required: false }) ??
    "platform";

  await new Deno.Command("kubectl", {
    args: [
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
  }).spawn().status;
}

await runMain(main);
