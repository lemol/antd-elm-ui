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
