import mls from 'multilines';
import { ValueObject } from '../utils';
import * as basic from './basic';
import { Px, Color } from './basic';

export type BorderStyle =
    'solid'
  | 'dashed'
  | 'dotted';

export type Border = {
  width?: Px,
  radius?: Px,
  color?: Color,
  style?: BorderStyle,
};

export type BorderValue = { border: Border };

export function borderStyle(css: string): BorderStyle {
  return ({
    'solid': 'solid',
    'dashed': 'dashed',
    'dotted': 'dotted',
  } as any)[css] || 'solid';
}

export function parseBorder(css: {
  border?: string,
  borderColor?: string,
  borderRadius?: string
}): Border {
  const result : Border = {
  };

  if (css.border) {
    parseAndSetBorder(css.border, result);
  }

  if (css.borderColor) {
    parseAndSetBorderColor(css.borderColor, result);
  }

  if (css.borderRadius) {
    parseAndSetBorderRadius(css.borderRadius, result);
  }

  return result;
}

function parseAndSetBorder(css: string, result: Border) {
  let splited = css.split(' ');

  result.width = basic.px.parse(splited[0]);
  result.style = borderStyle(splited[1]);
  result.color = basic.color.parse(splited[2]);
}

function parseAndSetBorderColor(css: string, result: Border) {
  result.color = basic.color.parse(css);
}

function parseAndSetBorderRadius(css: string, result: Border) {
  result.radius = basic.px.parse(css);
}


export const border : ValueObject<Border> = {
  parse: (css: string) => {
    return {} as any;
  },
  writeValue: (value: Border) => {
    console.log(value)
    return mls`
    | { width = ${basic.px.writeValue(value.width || 1)}
    | , style = ${value.style}
    | ${value.color && `, color = ${basic.color.writeValue(value.color)}`}
    | ${value.radius && `, raidus = ${basic.px.writeValue(value.radius)}`}
    | }
    `;
  },
  writeType: (value: Border) => 'Border',
};
