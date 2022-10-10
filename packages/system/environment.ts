/**
 * Returns the value of the given environment variable or raises if not found.
 * @param key
 */
export function fetchEnv(key: string) {
  const value = Deno.env.get(key);

  if (value === undefined) {
    throw new Error(
      `could not fetch environment variable "${key}" because it is not set`,
    );
  }

  return value;
}
