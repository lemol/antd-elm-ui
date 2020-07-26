module Ant exposing (..)

import Ant.Theme as Theme
import Element exposing (Element)
import Element.Background as Background
import Element.Font as Font
import Html exposing (Html)


layout : List (Element.Attribute msg) -> Element msg -> Html msg
layout =
    layoutBase Theme.body


layoutBase theme attrs =
    let
        baseAttrs =
            [ Font.color theme.fontColor
            , Font.size theme.fontSize
            , theme.fontVariant
            , theme.fontFamily
            , Background.color theme.backgroundColor
            ]
    in
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
