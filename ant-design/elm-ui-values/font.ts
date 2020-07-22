import * as basic from '../elm-ui-types/basic';
import * as font from '../elm-ui-types/font';
import { subset } from '../utils';

export function color(declarations: Array<{name:string,value:string}>) {
  const elmDeclarations = [];

  const result = subset(declarations, ['color']).map(decl => {
    if(decl.name === 'color') {
      return {
        name: 'fontColor',
        value: {
          color: basic.color.parse(decl.value),
        }
      }
    }
  }).filter(x => !!x);

  return result;
}

export function fontSize(declarations: Array<{name:string,value:string}>) {
  const elmDeclarations = [];

  const result = subset(declarations, ['font_size']).map(decl => {
    if(decl.name === 'font_size') {
      return {
        name: 'fontSize',
        value: {
          px: basic.px.parse(decl.value),
        }
      }
    }
  }).filter(x => !!x);

  return result;
}

export function fontWeight(declarations: Array<{name:string,value:string}>) {
  const elmDeclarations = [];

  const result = subset(declarations, ['font_weight']).map(decl => {
    if(decl.name === 'font_weight') {
      return {
        name: 'fontWeight',
        value: {
          fontWeight: font.fontWeight.parse(decl.value),
        }
      }
    }
  }).filter(x => !!x);

  return result;
}
