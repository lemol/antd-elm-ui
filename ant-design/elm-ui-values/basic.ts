import * as basic from '../elm-ui-types/basic';
import { subset } from '../utils';

export function height(declarations: Array<{name:string,value:string}>) {
  const elmDeclarations = [];

  const result = subset(declarations, ['height']).map(decl => {
    if(decl.name === 'height') {
      return {
        name: decl.name,
        value: {
          px: basic.px.parse(decl.value),
        }
      }
    }
  }).filter(x => !!x);

  return result;
}

export function width(declarations: Array<{name:string,value:string}>) {
  const elmDeclarations = [];

  const result = subset(declarations, ['width', 'min_width']).map(decl => {
    if(decl.name === 'width' || decl.name === 'min_width') {
      return {
        name: decl.name,
        value: {
          px: basic.px.parse(decl.value),
        }
      }
    }
  }).filter(x => !!x);

  return result;
}

export function padding(declarations: Array<{name:string,value:string}>) {
  const result1 = subset(declarations, ['padding']).map(decl => {
    if(decl.name === 'padding') {
      const splited = decl.value.split(' ');
      return splited;
    }
  })
  .filter(x => !!x)
  .map(x => x as string[])
  .map(([t, r, b, l]) => {
    const top = t;
    const right = r || top;
    const bottom = b || top;
    const left = l || right;

    return { top, right, bottom, left };
  })[0];

  const result2 = subset(declarations, ['padding_left', 'padding_right']).map(decl => {
    const side = decl.name.replace('padding_', '');
    return { [side]: decl.value };
  })
  .filter(x => !!x)
  .reduce((acc, act) => ({ ...acc, ...act}), {});

  const result = { ...result1, ...result2 };

  const ret = Object.keys(result || []).map(name => ({
    name: `padding${name[0].toUpperCase()}${name.substring(1)}`,
    value: {
      px: basic.px.parse((result as any)[name]),
    },
  }));

  return ret;
}

export function backgroundColor(declarations: Array<{name:string,value:string}>) {

  const result = subset(declarations, ['background', 'background_color']).map(decl => {
    if(decl.name === 'background' || decl.name === 'background_color') {
      return {
        name: 'backgroundColor',
        value: {
          color: basic.color.parse(decl.value),
        }
      }
    }
  }).filter(x => !!x);

  return result;
}

