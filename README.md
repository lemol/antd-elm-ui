# Ant Design for Elm UI

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Elm package](https://img.shields.io/elm-package/v/lemol/ant-design-elm-ui.svg)](https://package.elm-lang.org/packages/lemol/ant-design-elm-ui/latest/)
[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/lemol/ant-design-elm-ui)

> **📦 [Package documentation](https://package.elm-lang.org/packages/lemol/ant-design-elm-ui/latest)**

> **🎬 [Showcase](https://ant-design-elm-ui.vercel.app)**

This is the [ant-design](https://ant.design) for [mdgriffith/elm-ui](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/).

Try the below example [on Ellie](https://ellie-app.com/new) or navigate to the [complete showcase](https://ant-design-elm-ui.vercel.app)!

```elm
module Main exposing (main)

import Ant
import Ant.Button as Button
import Element exposing (Element)
import Html exposing (Html)



main : Html msg
main =
    Ant.layout
        []
        (Button.primary []
            { label = Element.text "Hello!"
            , onClick = Nothing
            }
        )
```

## Install

```bash
elm install lemol/ant-design-elm-ui
```


## Contributing

* Issues reporting and pull requests are welcome

* You can find @lemol on [Elm Slack](https://elmlang.slack.com/)

* [![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/lemol/ant-design-elm-ui)

## Resources

* https://ant.design

* https://github.com/ant-design/ant-design


## License

MIT License
