import Color from 'color';
import { ValueObject } from '../utils';


export type Px = number;

export type PxValue = { px: Px };

export { Color };

export type ColorValue = {
  color: Color
};

export const px : ValueObject<Px> = {
  parse: (css: string) => {
    return parseInt(css.replace('px', ''));
  },
  writeValue: (value: Px) => value.toString(),
  writeType: (value: Px) => 'Int',
};

export const color : ValueObject<Color> = {
  parse: (css: string) => {
    const col = new Color(css);
    return col;
  },
  writeValue: (value: Color) => {
    const { r, g, b, alpha } = value.object();

    if (alpha === 1 || alpha === undefined) {
      return `rgb255 ${r} ${g} ${b}`;
    }

    return `rgba255 ${r} ${g} ${b} ${alpha}`;
  },
  writeType: (value: Color) => 'Color',
};
