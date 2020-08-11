module Ant.Typography.Title exposing
    ( Attribute
    , danger
    , fromMaybe
    , h1
    , h2
    , h3
    , h4
    , secondary
    , titleBase
    , warning
    )

import Ant.Theme as Theme
import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input
import Element.Region as Region
import Utils exposing (style)


type Attribute msg
    = None
    | TitleLevel Level
    | TitleType Type


type Level
    = H1
    | H2
    | H3
    | H4


type Type
    = TypeNormal
    | Secondary
    | Warning
    | Danger


type alias TypographyOptions msg =
    { text : Element msg
    }


type alias Props =
    { level : Level
    , type_ : Type
    }


h1 : List (Attribute msg) -> TypographyOptions msg -> Element msg
h1 attrs =
    titleBase Theme.h1 (TitleLevel H1 :: attrs)


h2 : List (Attribute msg) -> TypographyOptions msg -> Element msg
h2 attrs =
    titleBase Theme.h2 (TitleLevel H2 :: attrs)


h3 : List (Attribute msg) -> TypographyOptions msg -> Element msg
h3 attrs =
    titleBase Theme.h3 (TitleLevel H3 :: attrs)


h4 : List (Attribute msg) -> TypographyOptions msg -> Element msg
h4 attrs =
    titleBase Theme.h4 (TitleLevel H4 :: attrs)


titleBase theme attrs opts =
    let
        props =
            fromAttributes attrs

        region =
            case props.level of
                H1 ->
                    Region.heading 1

                H2 ->
                    Region.heading 2

                H3 ->
                    Region.heading 3

                H4 ->
                    Region.heading 4

        typeAttrs =
            case props.type_ of
                TypeNormal ->
                    [ Font.color theme.normal.fontColor
                    ]

                Secondary ->
                    [ Font.color theme.secondary.fontColor
                    ]

                Warning ->
                    [ Font.color theme.warning.fontColor
                    ]

                Danger ->
                    [ Font.color theme.danger.fontColor
                    ]
    in
    Element.el
        ([ Font.size theme.normal.fontSize
         , theme.normal.fontWeight
         , region
         , style "margin-bottom" "0.5em"
         , style "line-height" "1.23"
         ]
            ++ typeAttrs
        )
        opts.text



-- ATTRIBUTES


secondary : Attribute msg
secondary =
    TitleType Secondary


warning : Attribute msg
warning =
    TitleType Warning


danger : Attribute msg
danger =
    TitleType Danger



-- HELPERS


fromMaybe : Maybe (Attribute msg) -> Attribute msg
fromMaybe =
    Maybe.withDefault None



-- INTERNAL


defaultProps : Props
defaultProps =
    { level = H1
    , type_ = TypeNormal
    }


fromAttributes : List (Attribute msg) -> Props
fromAttributes =
    let
        f act acc =
            case act of
                TitleLevel x ->
                    { acc | level = x }

                TitleType x ->
                    { acc | type_ = x }

                None ->
                    acc
    in
    List.foldl f defaultProps
