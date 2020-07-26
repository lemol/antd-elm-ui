module Explorer exposing (main)

import Html exposing (Html)
import Element exposing (Element)
import Ant
import Ant.Button as Button
import UIExplorer
    exposing
        ( UIExplorerProgram
        , defaultConfig
        , category
        , createCategories
        , exploreWithCategories
        , storiesOf
        , logoFromUrl
        )



config =
    { defaultConfig
        | customHeader =
            Just
                { title = "Ant Design Elm-UI"
                , logo = logoFromUrl "ant-design-elm-ui.png"
                , titleColor = Just "#FFFFFF"
                , bgColor = Just "#22292f"
                }
    }


main : UIExplorerProgram {} () {}
main =
    exploreWithCategories
        config
        (createCategories
            |> category
                "General"
                generalStories
        )


generalStories =
    [ buttonStories
    ]


buttonStories =
    storiesOf
        "Button"
        [ ( "Type", \_ -> toHtml buttonTypes , {} )
        , ( "Size", \_ -> toHtml buttonSizes , {} )
        ]


buttonTypes =
    buttonView Button.defaultSize


buttonSizes =
    buttonView Button.large


buttonView : Button.Attribute msg -> Element msg
buttonView sizeAttribute =
    Element.row
        [ Element.spacing 8
        ]
        [ Button.default
            [ sizeAttribute ]
            { onPress = Nothing
            , label = Element.text "Default Button"
            }
        , Button.primary
            [ sizeAttribute ]
            { onPress = Nothing
            , label = Element.text "Primary Button"
            }
        , Button.dashed
            [ sizeAttribute ]
            { onPress = Nothing
            , label = Element.text "Dashed Button"
            }
        , Button.text
            [ sizeAttribute ]
            { onPress = Nothing
            , label = Element.text "Text Button"
            }
        ]


toHtml : Element msg -> Html msg
toHtml =
    Ant.layout [ Element.width Element.fill ]
