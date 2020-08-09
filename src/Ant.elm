module Ant exposing
    ( layout
    , layoutBase
    , unless
    , when
    )

import Ant.Icon exposing (styleNode)
import Ant.Theme as Theme
import Element exposing (Element)
import Element.Background as Background
import Element.Font as Font
import Html exposing (Html)


layout : List (Element.Attribute msg) -> Element msg -> Html msg
layout =
    layoutBase Theme.body


layoutBase theme attrs content =
    let
        baseAttrs =
            [ Font.color theme.fontColor
            , Font.size theme.fontSize
            , theme.fontVariant
            , theme.fontFamily
            , Background.color theme.backgroundColor
            ]

        uiLayout =
            Element.layoutWith
                { options =
                    [ Element.focusStyle
                        { borderColor = Nothing
                        , backgroundColor = Nothing
                        , shadow = Nothing
                        }
                    ]
                }
                (baseAttrs ++ attrs)
                content
    in
    Html.div
        []
        [ styleNode
        , uiLayout
        ]



-- HELPERS


when : Bool -> a -> Maybe a
when condition value =
    if condition then
        Just value

    else
        Nothing


unless : Bool -> a -> Maybe a
unless condition value =
    if condition then
        Nothing

    else
        Just value
