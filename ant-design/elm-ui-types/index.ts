
import * as basic from './basic';
import * as border from './border';
import * as font from './font';

export type ElmValue =
  basic.PxValue
  | basic.ColorValue
  | font.FontWeightValue
  | font.FontAlignValue
  | font.FontVariantValue
  | font.FontFamilyValue
  | border.BorderValue
  | border.ShadowValue

export function isPxValue(value: ElmValue): value is basic.PxValue {
  return (value as basic.PxValue).px !== undefined;
}

export function isColorValue(value: ElmValue): value is basic.ColorValue {
  return (value as basic.ColorValue).color !== undefined;
}

export function isFontWeightValue(value: ElmValue): value is font.FontWeightValue {
  return (value as font.FontWeightValue).fontWeight !== undefined;
}

export function isFontAlignValue(value: ElmValue): value is font.FontAlignValue {
  return (value as font.FontAlignValue).fontAlign !== undefined;
}

export function isFontVariantValue(value: ElmValue): value is font.FontVariantValue {
  return (value as font.FontVariantValue).fontVariant !== undefined;
}

export function isFontFamilyValue(value: ElmValue): value is font.FontFamilyValue {
  return (value as font.FontFamilyValue).fontFamily !== undefined;
}

export function isBorderValue(value: ElmValue): value is border.BorderValue {
  return (value as border.BorderValue).border !== undefined;
}

export function isShadowValue(value: ElmValue): value is border.ShadowValue {
  return (value as border.ShadowValue).shadow !== undefined;
}

export function writeElmValue(value: ElmValue): string {
  if (isPxValue(value)) {
    return basic.px.writeValue(value.px);
  } else if (isColorValue(value)) {
    return basic.color.writeValue(value.color);
  } else if (isFontWeightValue(value)) {
    return font.fontWeight.writeValue(value.fontWeight);
  } else if (isFontAlignValue(value)) {
    return font.fontAlign.writeValue(value.fontAlign);
  } else if (isFontVariantValue(value)) {
    return font.fontVariant.writeValue(value.fontVariant);
  } else if (isFontFamilyValue(value)) {
    return font.fontFamily.writeValue(value.fontFamily);
  } else if (isBorderValue(value)) {
    return border.border.writeValue(value.border);
  } else if (isShadowValue(value)) {
    return border.shadow.writeValue(value.shadow);
  }

  return 'no-writer';
}

export function writeElmType(value: ElmValue): string {
  if (isPxValue(value)) {
    return basic.px.writeType(value.px);
  } else if (isColorValue(value)) {
    return basic.color.writeType(value.color);
  }

  return 'no-writer';
}
