import * as basic from '../elm-ui-types/basic';
import * as borderT from '../elm-ui-types/border';
import { subset } from '../utils';

export function border(declarations: Array<{name:string,value:string}>) {
  const elmDeclarations = [];

  const result = subset(declarations, ['border', 'border_color', 'border_radius']).reduce((acc, decl) => {
    return {
      ...acc,
      [decl.name]: decl.value,
    }
  }, {} as any);

  return [
    {
      name: 'border',
      value: {
        border: borderT.parseBorder({
          border: result.border,
          borderColor: result.border_color,
          borderRadius: result.border_radius,
        }),
      }
    }
  ];
}

export function shadow(declarations: Array<{name:string,value:string}>) {
  const elmDeclarations = [];

  const result = subset(declarations, ['box_shadow']).reduce((acc, decl) => {
    return {
      ...acc,
      [decl.name]: decl.value,
    }
  }, {} as any);

  return [
    {
      name: 'shadow',
      value: {
        shadow: borderT.parseShadow(result.box_shadow),
      }
    }
  ];
}
