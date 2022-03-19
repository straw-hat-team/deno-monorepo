/**
 * Performs `Deno.remove` but does not throw if the file does not exist.
 * @param path
 * @param options
 */
export async function maybeRemove(
  path: string | URL,
  options?: Deno.RemoveOptions,
) {
  try {
    await Deno.remove(path, options);
  } catch (err) {
    if (err instanceof Deno.errors.NotFound) {
      return;
    }
    throw err;
  }
}

/**
 * Performs `Deno.chmod` but does not throw if the path does not exist.
 * @param path
 * @param mode
 */
export async function maybeChmod(path: string | URL, mode: number) {
  try {
    await Deno.chmod(path, mode);
  } catch (err) {
    if (err instanceof Deno.errors.NotFound) {
      return;
    }
    throw err;
  }
}
