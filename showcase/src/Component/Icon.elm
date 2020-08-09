module Component.Icon exposing (stories)

import Ant.Icon exposing (fill, height, rotate, spin, width)
import Ant.Icons as Icons
import Element exposing (Element)
import Element.Font as Font
import PluginOptions exposing (withKnobs)
import UIExplorer exposing (storiesOf)



-- STORIES


stories =
    ( "Icon"
    , [ ( "Basic", basic, PluginOptions.default )
      , ( "List of icons", listOfIcons, PluginOptions.default )
      ]
    )


basic : Element msg
basic =
    Element.row
        [ Element.spacing 6
        ]
        [ Icons.homeOutlined
            [ width 24
            , height 24
            ]
        , Icons.settingFilled
            [ width 24
            , height 24
            ]
        , Icons.smileOutlined
            [ width 24
            , height 24
            ]
        , Icons.syncOutlined
            [ width 24
            , height 24
            , spin
            ]
        , Icons.smileOutlined
            [ width 24
            , height 24
            , rotate 180
            , fill (Element.rgb 1 0 1)
            ]
        , Icons.loadingOutlined
            [ width 24
            , height 24
            ]
        ]


listOfIcons : Element msg
listOfIcons =
    Element.paragraph
        []
        [ Element.text "The list of icons are shown in the "
        , Element.link
            [ Element.mouseOver
                [ Font.color (Element.rgb255 0x00 0x00 0xDD) ]
            ]
            { url = "https://ant-design-icons-elm-ui.vercel.app/#Default/Directional%20Icons/Outlined"
            , label = Element.text "lemol/ant-design-icons-elm-ui package"
            }
        , Element.text "."
        ]
