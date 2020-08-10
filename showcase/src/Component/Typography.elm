module Component.Typography exposing (stories)

import Ant.Typography exposing (h1, h2, h3, h4)
import Element exposing (Element)
import Element.Font as Font
import PluginOptions exposing (withKnobs)
import UIExplorer exposing (storiesOf)



-- STORIES


stories =
    ( "Typography"
    , [ ( "Basic", basic, PluginOptions.default )
      , ( "Title", titleView, PluginOptions.default )
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
    Element.column
        []
        [ h1 []
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
