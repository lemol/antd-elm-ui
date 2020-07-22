import { ValueObject } from '../utils';

export type FontWeight =
    'heavy'
  | 'extraBold'
  | 'bold'
  | 'semiBold'
  | 'medium'
  | 'regular'
  | 'light'
  | 'extraLight'
  | 'hairline';

export type FontAlign =
  'center'
  | 'alignLeft'
  | 'alignRight'
  | 'justify';

export type FontWeightValue = { fontWeight: FontWeight };

export type FontAlignValue = { fontAlign: FontAlign };

export const fontWeight : ValueObject<FontWeight> = {
  parse: (css: string) => {
    return ({
      '100': 'hairline',
      '200': 'extraLight',
      '300': 'light',
      '400': 'regular',
      '500': 'medium',
      '600': 'semiBold',
      '700': 'bold',
      '800': 'extraBold',
      '900': 'heavy',
    } as any)[css] || 'medium';
  },
  writeValue: (value: FontWeight) => {
    return `Font.${value}`;
  },
  writeType: (value: FontWeight) => 'Attribute msg',
};

export const fontAlign : ValueObject<FontAlign> = {
  parse: (css: string) => {
    return ({
      'left': 'alignLeft',
      'right': 'alignRight',
      'center': 'center',
      'justify': 'justify',
    } as any)[css] || 'center';
  },
  writeValue: (value: FontAlign) => {
    return `Font.${value}`;
  },
  writeType: (value: FontAlign) => 'Attribute msg',
};
