import _ from 'lodash';
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

export type FontVariant =
  'normal'
  | 'smallCaps'
  | 'slashedZero'
  | 'ligatures'
  | 'ordinal'
  | 'tabularNumbers'
  | 'stackedFractions'
  | 'diagonalFractions'

export type FontFamily = Array<{ generic: string } | { typeface: string }>

export type FontWeightValue = { fontWeight: FontWeight };

export type FontAlignValue = { fontAlign: FontAlign };

export type FontVariantValue = { fontVariant: FontVariant };

export type FontFamilyValue = { fontFamily: FontFamily };

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

export const fontVariant : ValueObject<FontVariant> = {
  parse: (css: string) => {
    return ({
      'normal': 'normal',
      'small-caps': 'smallCaps',
      'slashed-zero': 'slashedZero',
      'common-ligatures': 'ligatures',
      'ordinal': 'ordinal',
      'tabular-nums': 'tabularNumbers',
      'stacked-fractions': 'stackedFractions',
      'diagonal-fractions': 'diagonalFractions',
    } as any)[css] || 'normal';
  },
  writeValue: (value: FontVariant) => {
    return `Font.variantList [${value === 'normal' ? '' : `Font.${value}`}]`;
  },
  writeType: (value: FontVariant) => 'Attribute msg',
};

export const fontFamily : ValueObject<FontFamily> = {
  parse: (css: string) => {
    const splited = css.split(',');

    const result = splited.map(x => _.trim(x, `' `))
      .map(x => (({
        'serif': { generic: 'serif' },
        'sans-serif': { generic: 'sansSerif' },
        'monospace': { generic: 'monospace' },
      } as any)[x] || { typeface: x }))

    return result;
  },
  writeValue: (value: FontFamily) => {
    const family = value.map((x: any) => {
      if (x.generic) {
        return `Font.${x.generic}`;
      } else if (x.typeface) {
        return `Font.typeface "${x.typeface}"`;
      }
    })
    .filter(x => !!x);

    return `Font.family [${family.join(',\n')}]`;
  },
  writeType: (value: FontFamily) => 'Attribute msg',
};
