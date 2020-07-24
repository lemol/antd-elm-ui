module Ant.Button exposing (Attribute, dashed, default, primary, text)

import Ant.Theme as Theme
import Element exposing (Element, px)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input


type ButtonShape
    = Circle
    | Round


type ButtonSize
    = Large
    | Middle
    | Small


type ButtonType
    = Default
    | Primary
    | Ghost
    | Dashed
    | Danger
    | Link
    | Text


type Attribute msg
    = Shape ButtonShape
    | Size ButtonSize
    | Type ButtonType
    | Root (Element.Attribute msg)


type alias Button msg =
    { onPress : Maybe msg
    , label : Element msg
    }


default : List (Attribute msg) -> Button msg -> Element msg
default =
    base Theme.button_default


primary : List (Attribute msg) -> Button msg -> Element msg
primary =
    base Theme.button_primary


dashed : List (Attribute msg) -> Button msg -> Element msg
dashed =
    base Theme.button_dashed


text : List (Attribute msg) -> Button msg -> Element msg
text =
    base Theme.button_text



--base : ButtonTheme -> List (Attribute msg) -> Button msg -> Element msg


base theme attrs opts =
    let
        attrsBase =
            [ Element.height <| px theme.height
            , Font.color theme.fontColor
            , Font.size theme.fontSize
            , theme.fontWeight
            , theme.fontAlign
            , Border.width theme.border.width
            , theme.border.style
            , Border.rounded theme.border.radius
            , Border.color theme.border.color
            , Border.shadow theme.shadow
            , Background.color theme.backgroundColor
            , Element.paddingEach
                { top = theme.paddingTop
                , right = theme.paddingRight
                , bottom = theme.paddingBottom
                , left = theme.paddingLeft
                }
            ]
    in
    Element.Input.button
        attrsBase
        opts

