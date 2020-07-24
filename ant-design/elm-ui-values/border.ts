import * as basic from '../elm-ui-types/basic';
import * as borderT from '../elm-ui-types/border';
import { subset } from '../utils';

export function border(declarations: Array<{name:string,value:string}>) {
  const elmDeclarations = [];

  const result = subset(declarations, ['border', 'border_color', 'border_radius', 'border_style']).reduce((acc, decl) => {
    return {
      ...(acc || {}),
      [decl.name]: decl.value,
    }
  }, undefined as any);

  if (!result) {
    return [];
  }

  return [
    {
      name: 'border',
      value: {
        border: borderT.parseBorder({
          border: result.border,
          borderStyle: result.border_style,
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
      ...(acc || {}),
      [decl.name]: decl.value,
    }
  }, undefined as any);

  if (!result) {
    return [];
  }

  return [
    {
      name: 'shadow',
      value: {
        shadow: borderT.parseShadow(result.box_shadow),
      }
    }
  ];
}
