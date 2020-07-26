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
            [ Font.color theme.normal.fontColor
            , theme.normal.fontWeight
            , theme.normal.fontAlign
            , Border.width theme.normal.border.width
            , theme.normal.border.style
            , Border.color theme.normal.border.color
            , Border.shadow theme.normal.shadow
            , Background.color theme.normal.backgroundColor
            , Element.mouseOver
                [ Background.color theme.hover.backgroundColor
                , Font.color theme.hover.fontColor
                , Border.color theme.hover.border.color
                ]
            , Element.mouseDown
                [ Background.color theme.active.backgroundColor
                , Font.color theme.active.fontColor
                , Border.color theme.active.border.color
                ]
            , Element.focused
                [ Background.color theme.focus.backgroundColor
                , Font.color theme.focus.fontColor
                , Border.color theme.focus.border.color
                ]
            ]

        size =
            Small

        sizeAttrs =
            case size of
                Small ->
                    [ Element.height <| px theme.small.height
                    , Element.paddingEach
                        { top = theme.small.paddingTop
                        , right = theme.small.paddingRight
                        , bottom = theme.small.paddingBottom
                        , left = theme.small.paddingLeft
                        }
                    , Font.size theme.small.fontSize
                    , Border.rounded theme.small.border.radius
                    ]

                Middle ->
                    [ Element.height <| px theme.normal.height
                    , Element.paddingEach
                        { top = theme.normal.paddingTop
                        , right = theme.normal.paddingRight
                        , bottom = theme.normal.paddingBottom
                        , left = theme.normal.paddingLeft
                        }
                    , Font.size theme.normal.fontSize
                    , Border.rounded theme.normal.border.radius
                    ]

                Large ->
                    [ Element.height <| px theme.large.height
                    , Element.paddingEach
                        { top = theme.large.paddingTop
                        , right = theme.large.paddingRight
                        , bottom = theme.large.paddingBottom
                        , left = theme.large.paddingLeft
                        }
                    , Font.size theme.large.fontSize
                    , Border.rounded theme.large.border.radius
                    ]
    in
    Element.Input.button
        (attrsBase ++ sizeAttrs)
        opts
