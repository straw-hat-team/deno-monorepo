import { jsonStringify, log } from "../../logger/mod.ts";
import { Args, getArg, runMain } from "../mod.ts";
import { executeRequest } from "./mod.ts";

async function main(args: Args) {
  const githubToken = getArg(args, "github-token");
  const githubOrg = getArg(args, "github-org");
  const githubRepo = getArg(args, "github-repo");
  const tagName = getArg(args, "tag-name");

  const response = await executeRequest<{ id: string }>({
    method: "GET",
    url: "/repos/{owner}/{repo}/releases/tags/{tag}",
    token: githubToken,
    params: {
      path: {
        owner: githubOrg,
        repo: githubRepo,
        tag: tagName,
      },
    },
  });

  await executeRequest({
    method: "DELETE",
    url: "/repos/{owner}/{repo}/releases/{releaseId}",
    token: githubToken,
    params: {
      path: {
        owner: githubOrg,
        repo: githubRepo,
        releaseId: response.id,
      },
    },
  });

  log.info(
    `release deleted ${jsonStringify({
      tagName,
      id: response.id,
      repo: `${githubOrg}/${githubRepo}`,
    })}`,
  );

  await executeRequest({
    method: "DELETE",
    url: "/repos/{owner}/{repo}/git/refs/{ref}",
    token: githubToken,
    params: {
      path: {
        owner: githubOrg,
        repo: githubRepo,
        ref: `tags/${tagName}`,
      },
    },
  });

  log.info(
    `tag deleted ${jsonStringify({
      tagName,
      repo: `${githubOrg}/${githubRepo}`,
    })}`,
  );
}

await runMain(main);
