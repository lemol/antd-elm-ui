import css from 'css';

export type ValueObject<T> = {
  parse: (css: string) => T,
  writeValue: (value: T) => string,
  writeType: (value: T) => string,
}

export function subset(declarations: Array<{name: string, value:string}>, list: Array<string>) {
  return declarations.filter(x => list.includes(x.name));
}
