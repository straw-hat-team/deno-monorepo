export type NonUndefined<T> = T extends undefined ? never : T;

export type AnyObject = { [x: string]: any };
