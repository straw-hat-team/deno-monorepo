/**
 * Performs `Deno.remove` but does not throw if the file does not exist.
 * @param path
 * @param options
 */
import { AnyObject, NonUndefined } from "../types.ts";

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

/**
 * Returns undefined when the array is empty.
 * @param array
 */
export function excludeEmptyArray<T extends unknown[]>(
  array: T,
): T | undefined {
  return array.length > 0 ? array : undefined;
}

/**
 * Returns undefined when the object does not have any keys.
 * @param obj
 */
export function excludeEmptyObject<T extends Record<string, unknown>>(
  obj: T,
): T | undefined {
  return Object.keys(obj).length > 0 ? obj : undefined;
}

/**
 * Removes the keys from the object that have undefined values.
 * @param obj
 */
export function removeUndefinedValues<T extends AnyObject>(
  obj: T,
): { [x: string]: NonUndefined<T[keyof T]> } {
  const entries = Object.entries(obj).filter(([, value]) =>
    value !== undefined
  );
  return Object.fromEntries(entries);
}
