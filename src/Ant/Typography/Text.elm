module Ant.Typography.Text exposing
    ( Attribute
    , fromMaybe
    , text
    , textBase
    , typography
    )

import Ant.Theme as Theme
import Ant.Typography as Typography
import Element exposing (Element)


type Attribute msg
    = None
    | TypographyAttrs (List (Typography.Attribute msg))


type alias Props msg =
    { typographyAttrs : List (Typography.Attribute msg)
    }


text : List (Attribute msg) -> String -> Element msg
text attrs content =
    textBase Theme.text attrs content


textBase theme attrs content =
    let
        props =
            fromAttributes attrs

        base =
            Typography.typographyBase theme props.typographyAttrs
    in
    Element.el
        base.allAttrs
        (Element.text content)



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
    { typographyAttrs = []
    }


fromAttributes : List (Attribute msg) -> Props msg
fromAttributes =
    let
        f act acc =
            case act of
                TypographyAttrs x ->
                    { acc | typographyAttrs = x }

                None ->
                    acc
    in
    List.foldl f defaultProps
