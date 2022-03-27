import { replaceDynamicPathParams } from "../../openapi/mod.ts";
import { jsonStringify, log } from "../../logger/mod.ts";

export async function executeRequest<TResponse = unknown>(command: {
  token: string;
  url: string;
  method: string;
  params?: {
    path?: Record<string, string>;
    body?: Record<string, unknown>;
  };
}): Promise<TResponse> {
  const relativeUrl = replaceDynamicPathParams(
    command.url,
    command.params?.path,
  );
  const response = await fetch("https://api.github.com" + relativeUrl, {
    method: command.method,
    headers: {
      Accept: "application/vnd.github.v3+json",
      Authorization: `token ${command.token}`,
      "Content-Type": "application/json",
    },
    body: command.params?.body
      ? JSON.stringify(command.params?.body)
      : undefined,
  });

  if (response.status === 204) {
    // @ts-ignore TODO: Figure out how to remove this ignore.
    // A 204 response is returned when the request is successful, but there is
    // no content to return.
    // `TResponse` is `unknown` so we can't return `undefined`. If we instead
    // change the return type to be `Promise<TResponse | undefined>` then the
    // consumer will have to check for `undefined` and handle it appropriately.
    // This is error-prune, because if the consumer don't define the `TResponse`
    // to take into consideration 204 responses, then they will have issues
    // with `undefined` responses.
    return;
  }

  const body = await response.json();

  if (!response.ok) {
    throw new Error(
      `${command.method} ${relativeUrl} ${response.status} ${response.statusText} ${
        jsonStringify(body)
      }`,
    );
  }

  return body;
}
