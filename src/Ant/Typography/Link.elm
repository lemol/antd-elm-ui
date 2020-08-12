module Ant.Typography.Link exposing
    ( Attribute
    , fromMaybe
    , link
    , linkBase
    , newTabLink
    , typography
    )

import Ant.Theme as Theme
import Ant.Typography as Typography
import Element exposing (Element)
import Element.Font as Font


type Attribute msg
    = None
    | TypographyAttrs (List (Typography.Attribute msg))


type alias Props msg =
    { typographyAttrs : List (Typography.Attribute msg)
    }


type alias Options msg =
    { url : String
    , label : Element msg
    }


link : List (Attribute msg) -> Options msg -> Element msg
link =
    linkBase { typography = Theme.typography, link = Theme.link } Element.link


newTabLink : List (Attribute msg) -> Options msg -> Element msg
newTabLink =
    linkBase { typography = Theme.typography, link = Theme.link } Element.newTabLink


linkBase theme linkF attrs opts =
    let
        props =
            fromAttributes attrs

        base =
            Typography.typographyBase theme.typography props.typographyAttrs

        thisAttrs =
            [ Font.color theme.link.normal.fontColor
            , Element.mouseOver
                [ Font.color theme.link.hover.fontColor
                ]
            , Element.mouseDown
                [ Font.color theme.link.active.fontColor
                ]
            , Element.focused
                [ Font.color theme.link.focus.fontColor
                ]
            ]
    in
    linkF
        (base.allAttrs ++ thisAttrs)
        opts



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
