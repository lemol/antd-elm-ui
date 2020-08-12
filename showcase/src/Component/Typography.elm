module Component.Typography exposing (stories)

import Ant.Typography.Title as Title exposing (h1, h2, h3, h4)
import Ant.Typography.Text as Text exposing (text)
import Ant.Typography.Link as Link exposing (newTabLink)
import Ant.Typography as Typography exposing (secondary, warning, danger, disabled
  , mark, code, keyboard, underline, delete, strong)
import Element exposing (Element)
import Element.Font as Font
import PluginOptions exposing (withKnobs)
import UIExplorer exposing (storiesOf)



-- STORIES


stories =
    ( "Typography"
    , [ ( "Basic", basic, PluginOptions.default )
      , ( "Title", titleView, PluginOptions.default )
      , ( "Text and Link", textAndLinkView, PluginOptions.default )
      ]
    )


basic : Element msg
basic =
    Element.row
        [ Element.spacing 6
        ]
        []


titleView : Element msg
titleView =
    let
        default =
            Element.column
                [ Element.spacing 2
                ]
                [ h1
                    []
                    { text = Element.text "h1. Ant Design"
                    }
                , h2 []
                    { text = Element.text "h2. Ant Design"
                    }
                , h3 []
                    { text = Element.text "h3. Ant Design"
                    }
                , h4 []
                    { text = Element.text "h4. Ant Design"
                    }
                ]

        withTypes =
            Element.column
                [ Element.spacing 2
                ]
                [ h1
                    []
                    { text = Element.text "h1. Ant Design"
                    }
                , h2
                      [ Title.typography
                          [ secondary
                          ]
                      ]
                    { text = Element.text "h2. Ant Design"
                    }
                , h3
                      [ Title.typography
                          [ warning
                          ]
                      ]
                    { text = Element.text "h3. Ant Design"
                    }
                , h4
                      [ Title.typography
                          [ danger
                          ]
                      ]
                    { text = Element.text "h4. Ant Design"
                    }
                ]
    in
    Element.column
        [ Element.spacing 18
        ]
        [ default
        , withTypes
        ]

textAndLinkView : Element msg
textAndLinkView =
    let
        default =
            Element.column
                [ Element.spacing 2
                ]
                [ text
                    []
                    "Ant Design"
                , text
                    [ Text.typography
                        [ secondary ]
                    ]
                    "Ant Design"
                , text
                    [ Text.typography
                        [ warning ]
                    ]
                    "Ant Design"
                , text
                    [ Text.typography
                        [ danger ]
                    ]
                    "Ant Design"
                , text
                    [ Text.typography
                        [ disabled ]
                    ]
                    "Ant Design"
                , text
                    [ Text.typography
                        [ mark ]
                    ]
                    "Ant Design"
                , text
                    [ Text.typography
                        [ code ]
                    ]
                    "Ant Design"
                , text
                    [ Text.typography
                        [ keyboard ]
                    ]
                    "Ant Design"
                , text
                    [ Text.typography
                        [ underline ]
                    ]
                    "Ant Design"
                , text
                    [ Text.typography
                        [ delete ]
                    ]
                    "Ant Design"
                , text
                    [ Text.typography
                        [ strong ]
                    ]
                    "Ant Design"
                , newTabLink
                    [
                    ]
                    { url = "http://fruits.com"
                    , label = Element.text "Ant Design"
                    }
                ]
    in
    Element.column
        [ Element.spacing 18
        ]
        [ default
        ]
