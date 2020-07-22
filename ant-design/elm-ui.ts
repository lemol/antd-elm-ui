import _ from 'lodash';
import css from 'css';
import mls from 'multilines';
import { ElmValue, writeElmType, writeElmValue } from './elm-ui-types';
import * as basic from './elm-ui-values/basic';
import * as border from './elm-ui-values/border';
import * as font from './elm-ui-values/font';

type NameValue = {
  name: string,
  value: string,
}

export type ElmRecordValue = {
  name: string,
  value: ElmValue,
};

export type ElmRecord = {
  name: string,
  values: Array<ElmRecordValue>,
};

export type ElmModule = {
  name: string,
  imports: string,
  records: Array<ElmRecord>,
}

export function buildElmModule(name: string, selectors: Array<string>, css: Record<string, { declarations: Array<NameValue> }>) : ElmModule {
  const imports = mls`
  | import Element exposing (Color, rgb255, rgba255)
  | import Element.Font as Font
  | import Element.Border as Border
  `;

  const records = Object.keys(css)
    .filter(key => selectors.includes(key))
    .map(key => buildDeclarations(key, css[key].declarations))

  return {
    name,
    imports,
    records,
  }
}

export function buildDeclarations(name: string, declarations: Array<NameValue>) : ElmRecord {
  const values = buildForEach(
    declarations,
    [
      basic.height,
      basic.padding,
      basic.backgroundColor,
      font.color,
      font.fontSize,
      font.fontWeight,
      font.fontAlign,
      border.border,
      border.shadow,
    ]
  );

  return {
    name,
    values,
  };
}

export function writeElmModule({ name, imports, records }: ElmModule) {
  const result = mls`
  | module ${name} exposing (..)
  |
  | ${imports}
  |
  | ${records.map(writeElmRecord).join('\n\n')}
  `;

  return result;
}

export function writeElmRecord(record: ElmRecord) {
  const result = mls`
  | ${record.name} =
  |   { ${record.values.map(writeElmRecordValue).join(mls`
  |
  |   , `)}
  |   }
  `;

  return result;
}

function writeElmRecordValue({ name, value }: ElmRecordValue) : string {
  const result = mls`
  | ${name} = ${writeElmValue(value)}
  `;

  return result;
}

function buildForEach(declarations: Array<NameValue>, builders: Array<any>) {
  const result = _.flatten(builders.map((f: any) => f(declarations)));
  return result;
}
