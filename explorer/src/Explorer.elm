module Explorer exposing (main)

import Html exposing (Html)
import Element exposing (Element)
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
            [ ( "Default", \_ -> toHtml <| Button.default [] { onPress = Nothing, label = Element.text "OK" }, {} )
            , ( "Primary", \_ -> toHtml <| Button.primary [] { onPress = Nothing, label = Element.text "OK" }, {} )
            ]
        ]


toHtml : Element msg -> Html msg
toHtml =
    Element.layout [ Element.width Element.fill ]
