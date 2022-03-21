// deno-lint-ignore-file no-explicit-any

interface IJsonMarshaler {
  /**
   * Return the JSON representation of the resource.
   */
  toJSON(): any;
}

/**
 * Check if the object implements IJsonMarshaler interface.
 * @param obj
 */
function isJsonable(obj: any): obj is IJsonMarshaler {
  if (obj === null || obj === undefined) {
    return false;
  }
  return typeof obj.toJSON === "function";
}

interface IShellMarshaler {
  /**
   * Returns the representation of the object as a shell string.
   */
  toShell(): any;
}

/**
 * Check if the object implements IShellMarshaler interface.
 * @param obj
 */
function isShellable(obj: any): obj is IShellMarshaler {
  if (obj === null || obj === undefined) {
    return false;
  }
  return typeof obj.toShell === "function";
}

/**
 * If the substitutions object is a ShellMarshaler, then returns the
 * representation of the object as a shell string.
 */
function shell(strings: TemplateStringsArray, ...substitutions: any[]): string {
  const script = strings.reduce(
    (acc, str, i) => {
      const substitution = substitutions[i - 1];
      const value = isShellable(substitution)
        ? substitution.toShell()
        : substitution;

      return acc + (i > 0 ? value : "") + str;
    },
    "",
  );

  /**
   * TODO: Is it a good idea to replace all the whitespace with a single space?
   * What happen when a string contains multiple spaces intentionally?
   */
  return script.replace(/\n/g, "").replace(/\s+/g, " ");
}

/**
 * Remove the keys from the object is the value is undefined or null.
 */
function removeEmpty(obj: any) {
  const entries = Object
    .entries(obj)
    .filter(([_, v]) => v != null);
  return Object.fromEntries(entries);
}

export type { IJsonMarshaler, IShellMarshaler };
export { isJsonable, isShellable, removeEmpty, shell };
