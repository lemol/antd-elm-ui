module Ant.Button exposing
    ( Attribute
    , circle
    , dashed
    , default
    , defaultShape
    , defaultSize
    , large
    , primary
    , round
    , small
    , text
    )

import Ant.Theme as Theme
import Element exposing (Element, px)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input
import Utils exposing (style)


type ButtonShape
    = DefaultShape
    | Circle
    | Round


type ButtonSize
    = Large
    | DefaultSize
    | Small


type Attribute msg
    = Shape ButtonShape
    | Size ButtonSize
    | Root (Element.Attribute msg)


type alias ButtonOptions msg =
    { onPress : Maybe msg
    , label : Element msg
    }


type alias Props =
    { size : ButtonSize
    , shape : ButtonShape
    }


defaultProps : Props
defaultProps =
    { size = DefaultSize
    , shape = DefaultShape
    }


default : List (Attribute msg) -> ButtonOptions msg -> Element msg
default =
    base Theme.button_default


primary : List (Attribute msg) -> ButtonOptions msg -> Element msg
primary =
    base Theme.button_primary


dashed : List (Attribute msg) -> ButtonOptions msg -> Element msg
dashed =
    base Theme.button_dashed


text : List (Attribute msg) -> ButtonOptions msg -> Element msg
text =
    base Theme.button_text



--base : ButtonTheme -> List (Attribute msg) -> ButtonOptions msg -> Element msg


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

        props =
            fromAttributes attrs

        sizeAttrs =
            case props.size of
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

                DefaultSize ->
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

        shapeAttrs =
            case props.shape of
                DefaultShape ->
                    []

                Circle ->
                    [ theme.circle.fontAlign
                    , Element.paddingEach
                        { top = theme.normal.paddingTop
                        , bottom = theme.normal.paddingBottom
                        , left = theme.circle.paddingLeft
                        , right = theme.circle.paddingRight
                        }
                    , style "border-radius" "50%"
                    , Element.width (Element.fill |> Element.minimum theme.circle.min_width)
                    ]

                Round ->
                    [ Font.size theme.round.fontSize
                    , Element.height <| px theme.round.height
                    , Element.paddingEach
                        { top = theme.round.paddingTop
                        , bottom = theme.round.paddingBottom
                        , left = theme.round.paddingLeft
                        , right = theme.round.paddingRight
                        }
                    , Border.rounded theme.round.border.radius
                    ]
    in
    Element.Input.button
        (attrsBase
            ++ sizeAttrs
            ++ shapeAttrs
        )
        opts



-- SIZE ATTRIBUTES


small : Attribute msg
small =
    Size Small


defaultSize : Attribute msg
defaultSize =
    Size DefaultSize


large : Attribute msg
large =
    Size Large



-- SHAPE ATTRIBUTES


defaultShape : Attribute msg
defaultShape =
    Shape DefaultShape


circle : Attribute msg
circle =
    Shape Circle


round : Attribute msg
round =
    Shape Round



-- INTERNAL


fromAttributes : List (Attribute msg) -> Props
fromAttributes =
    let
        f act acc =
            case act of
                Size x ->
                    { acc | size = x }

                Shape x ->
                    { acc | shape = x }

                _ ->
                    acc
    in
    List.foldl f defaultProps
