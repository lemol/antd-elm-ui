module Explorer exposing (main)

import Html exposing (Html)
import Element exposing (Element)
import Ant
import Ant.Button as Button
import UIExplorer
    exposing
        ( UIExplorerProgram
        , defaultConfig
        , explore
        , storiesOf
        )


main : UIExplorerProgram {} () {}
main =
    explore
        defaultConfig
        [ storiesOf
            "Welcome"
            [ ( "Default", \_ -> toHtml <| Button.default [] { onPress = Nothing, label = Element.text "Default Button" }, {} )
            , ( "Primary", \_ -> toHtml <| Button.primary [] { onPress = Nothing, label = Element.text "Primary Button" }, {} )
            , ( "Dashed", \_ -> toHtml <| Button.dashed [] { onPress = Nothing, label = Element.text "Dashed Button" }, {} )
            , ( "Text", \_ -> toHtml <| Button.text [] { onPress = Nothing, label = Element.text "Text Button" }, {} )
            ]
        ]


toHtml : Element msg -> Html msg
toHtml =
    Ant.layout [ Element.width Element.fill ]
