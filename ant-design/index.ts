import fs from 'fs';
import css from 'css';


const antdpath = __dirname + '/antd.css';
const antdcss = fs.readFileSync(antdpath, 'utf8');

const ast = css.parse(antdcss, { source: 'antd.css' });

export function isRule(rule: css.AtRule): rule is css.Rule {
  return rule.type === 'rule';
}

const rules = ast.stylesheet?.rules
  .filter(x => isRule(x) && x.selectors?.includes('.ant-btn'))
  .map(buildRule);

function buildRule(cssRule: css.Rule) {
  const selectors = cssRule.selectors;

  if (!selectors) {
    return null;
  }

  const firstName = buildRuleName(selectors[0]);

  console.log(cssRule.declarations);

  return firstName;
}

function buildRuleName(cssName: string) {
  return cssName.replace('.ant-', '')
    .replace(/-/g, '_');
}

console.log(rules);

