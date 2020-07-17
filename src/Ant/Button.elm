module Ant.Button exposing (Attribute, default, primary)

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
    base Theme.button


primary : List (Attribute msg) -> Button msg -> Element msg
primary =
    base Theme.buttonPrimary



--base : ButtonTheme -> List (Attribute msg) -> Button msg -> Element msg


base theme attrs opts =
    let
        attrsBase =
            [ Font.medium
            , Font.size theme.font.size
            , Border.rounded theme.border.radius
            , Element.centerX
            , Element.height (px theme.size.height)
            , Element.paddingXY theme.position.paddingX 4
            , Font.color theme.color.font
            , Background.color theme.color.background
            , Border.color theme.color.border
            , Border.width theme.border.width
            , Border.shadow theme.border.shadow
            ]
    in
    Element.Input.button
        attrsBase
        opts

