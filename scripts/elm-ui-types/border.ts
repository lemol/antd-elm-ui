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

export type Shadow = {
  offset: Px[],
  size: Px,
  blur: Px,
  color: Color,
};

export type BorderValue = { border: Border };

export type ShadowValue = { shadow: Shadow };

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
  borderStyle?: string,
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

  if (css.borderStyle) {
    result.style = borderStyle(css.borderStyle);
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
    const props = [
      value.width !== undefined && `width = ${basic.px.writeValue(value.width)}`,
      value.style && `style = Border.${value.style}`,
      value.color && `color = ${basic.color.writeValue(value.color)}`,
      value.radius && `radius = ${basic.px.writeValue(value.radius)}`,
    ].filter(x => !!x);

    return `{ ${props.join(',\n')} }`;
  },
  writeType: (value: Border) => 'Border',
};

export function parseShadow(css: string): Shadow {
  if (css === 'none') {
    return {
      offset: [ 0, 0 ],
      blur: 0,
      size: 0,
      color: basic.color.parse('transparent'),
    };
  }

  const [ho, vo, b, s] = css.split(' ');

  const offset = [basic.px.parse(ho), basic.px.parse(vo)];
  const blur = basic.px.parse(b);
  const size = basic.px.parse(s) || 0;

  const colorStart = css.indexOf('rgb');
  const colorString = css.substring(colorStart);
  const color = basic.color.parse(colorString);

  const result : Shadow = {
    offset: offset,
    blur,
    size,
    color,
  };

  return result;
}

export const shadow : ValueObject<Shadow> = {
  parse: (css: string) => {
    return {} as any;
  },
  writeValue: (value: Shadow) => {
    return mls`
    | { offset = (${basic.px.writeValue(value.offset[0])}, ${basic.px.writeValue(value.offset[1])})
    | , blur = ${basic.px.writeValue(value.blur)}
    | , size = ${basic.px.writeValue(value.size)}
    | , color = ${basic.color.writeValue(value.color)}
    | }
    `;
  },
  writeType: (value: Shadow) => 'Shadow',
};

