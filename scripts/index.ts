import fs from 'fs';
import css from 'css';
import _ from 'lodash';
import * as elmUi from './elm-ui';


const antdpath = __dirname + '/antd.css';
const antdcss = fs.readFileSync(antdpath, 'utf8');

const ast = css.parse(antdcss, { source: 'antd.css' });

export function isRule(rule: css.AtRule): rule is css.Rule {
  return rule.type === 'rule';
}

const rules = ast.stylesheet?.rules
  .filter(x => isRule(x))
  .map(buildRule);

function buildRule(cssRule: css.Rule) {
  const selectors = cssRule.selectors;

  if (!selectors) {
    return null;
  }

  const firstName = buildRuleName(selectors[0]);
  const declarations = cssRule.declarations?.map(buildDeclaration) || [];
  const otherNames = _.tail(selectors).map(buildRuleName);

  const first = {
    [firstName]: {
      declarations,
    }
  };

  const others = otherNames.map(name => ({
    [name]: {
      declarations,
    }
  }));

  return _.concat([first], others);
}

function buildRuleName(cssName: string) {
  return cssName
    .replace(/^.ant-/g, '')
    .replace(/\./g, '__')
    .replace(/-sm$/g, '__sm')
    .replace(/-lg$/g, '__lg')
    .replace(/-/g, '_')
    .replace(/__ant_/g, '__')
    .replace(/:/g, '__')
    .replace(/ /g, '__');
}

function buildDeclaration(cssDeclaration: css.Declaration) {
  if (!cssDeclaration.property || !cssDeclaration.value) {
    return;
  }

  const name = buildDeclarationName(cssDeclaration.property);
  const value = buildDeclarationValue(cssDeclaration.value);

  return {
    name,
    value,
  }
}

function buildDeclarationName(cssName: string) {
  return cssName.replace(/-/g, '_');
}

function buildDeclarationValue(cssValue: string) {
  return cssValue;
}

function merger<T>(a: Array<T>, b: Array<T>, key: string) {
  if (_.isArray(a)) {
    return a.concat(b);
  }
}

const final = _.reduce(_.flatten(rules), (acc, act) => _.mergeWith(acc, act, merger), {});

const selectors = [
  'body',
  'btn',
  'btn_primary',
  'btn_dashed',
  'btn_text',
  'btn_circle',
  'btn_circle_outline',
  'btn_round',
  'btn_round_outline',
  'h1__typography',
  'h2__typography',
  'h3__typography',
  'h4__typography',
  'typography',
  'typography__typography_secondary',
  'typography__typography_warning',
  'typography__typography_danger',
  'typography__typography_disabled',
  'a__typography',
  'typography__code',
].reduce((acc, act) =>
  [
    ...acc,
    act,
    `${act}__hover`,
    `${act}__active`,
    `${act}__focus`,
    `${act}__sm`,
    `${act}__lg`,
  ]
, [] as string[]);

const elmModule = elmUi.buildElmModule('Ant.ThemeValues', selectors, final);
console.log(elmUi.writeElmModule(elmModule));
