export type NonUndefined<T> = T extends undefined ? never : T;

// deno-lint-ignore no-explicit-any
export type AnyObject = { [x: string]: any };
