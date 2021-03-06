module Ant.Typography.Title exposing
    ( Attribute
    , fromMaybe
    , h1
    , h2
    , h3
    , h4
    , titleBase
    , typography
    )

import Ant.Theme as Theme
import Ant.Typography as Typography
import Element exposing (Element)
import Element.Region as Region


type Attribute msg
    = None
    | TitleLevel Level
    | TypographyAttrs (List (Typography.Attribute msg))


type Level
    = H1
    | H2
    | H3
    | H4


type alias TypographyOptions msg =
    { text : Element msg
    }


type alias Props msg =
    { level : Level
    , typographyAttrs : List (Typography.Attribute msg)
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

        base =
            Typography.typographyBase theme props.typographyAttrs
    in
    Element.el
        (region :: base.allAttrs)
        opts.text



-- ATTRIBUTES


typography : List (Typography.Attribute msg) -> Attribute msg
typography =
    TypographyAttrs



-- HELPERS


fromMaybe : Maybe (Attribute msg) -> Attribute msg
fromMaybe =
    Maybe.withDefault None



-- INTERNAL


defaultProps : Props msg
defaultProps =
    { level = H1
    , typographyAttrs = []
    }


fromAttributes : List (Attribute msg) -> Props msg
fromAttributes =
    let
        f act acc =
            case act of
                TitleLevel x ->
                    { acc | level = x }

                TypographyAttrs x ->
                    { acc | typographyAttrs = x }

                None ->
                    acc
    in
    List.foldl f defaultProps
