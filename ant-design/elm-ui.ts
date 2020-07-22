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

export function buildDeclarations(name: string, declarations: Array<NameValue>) : ElmRecord {
  const values = buildForEach(
    declarations,
    [
      basic.height,
      font.color,
      font.fontSize,
      font.fontWeight,
      border.border,
    ]
  );

  return {
    name,
    values,
  };
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
