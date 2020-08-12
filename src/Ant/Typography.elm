module Ant.Typography exposing
    ( Attribute
    , code
    , danger
    , delete
    , disabled
    , fromMaybe
    , keyboard
    , mark
    , secondary
    , strong
    , typographyBase
    , underline
    , warning
    )

import Element
import Element.Font as Font
import Element.Border as Border
import Element.Background as Background
import Utils exposing (style)


type Attribute msg
    = None
    | TypographyDisabled
    | TypographyType Type
    | TypographyDecoration Decoration


type Type
    = TypeNormal
    | Secondary
    | Warning
    | Danger


type Decoration
    = Code
    | Mark
    | Underline
    | Delete
    | Strong
    | Keyboard


type alias Props =
    { type_ : Type
    , disabled : Bool
    , decorations : List Decoration
    }


typographyBase theme attrs =
    let
        props =
            fromAttributes attrs

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

        disabledAttrs =
            if props.disabled then
                [ Font.color theme.disabled.fontColor
                ]

            else
                []

        decorationAttrs =
            props.decorations
                |> List.map (decorationToAttrs theme)
                |> List.concat

        allAttrs =
            [ Font.size theme.normal.fontSize
            , theme.normal.fontWeight
            , style "margin-bottom" "0.5em"
            , style "line-height" "1.23"
            ]
                ++ typeAttrs
                ++ disabledAttrs
                ++ decorationAttrs
    in
    { props = props
    , typeAttrs = typeAttrs
    , disabledAttrs = disabledAttrs
    , decorationAttrs = decorationAttrs
    , allAttrs = allAttrs
    }


--decorationToAttrs : Decoration -> List (Element.Attribute msg)
decorationToAttrs theme dec =
    case dec of
        Code ->
            [ Background.color theme.code.backgroundColor
            , Border.width theme.code.border.width
            , theme.code.border.style
            , Border.color theme.code.border.color
            , Border.rounded theme.code.border.radius
            , style "font-size" "85%"
            , style "padding" "0.2em 0.4em 0.1em"
            ]

        Mark ->
            []

        Underline ->
            [ Font.underline ]

        Delete ->
            [ Font.strike ]

        Strong ->
            [ Font.bold ]

        Keyboard ->
            []



-- ATTRIBUTES


secondary : Attribute msg
secondary =
    TypographyType Secondary


warning : Attribute msg
warning =
    TypographyType Warning


danger : Attribute msg
danger =
    TypographyType Danger


disabled : Attribute msg
disabled =
    TypographyDisabled


code : Attribute msg
code =
    TypographyDecoration Code


mark : Attribute msg
mark =
    TypographyDecoration Mark


underline : Attribute msg
underline =
    TypographyDecoration Underline


delete : Attribute msg
delete =
    TypographyDecoration Delete


strong : Attribute msg
strong =
    TypographyDecoration Strong


keyboard : Attribute msg
keyboard =
    TypographyDecoration Keyboard



-- HELPERS


fromMaybe : Maybe (Attribute msg) -> Attribute msg
fromMaybe =
    Maybe.withDefault None



-- INTERNAL


defaultProps : Props
defaultProps =
    { type_ = TypeNormal
    , disabled = False
    , decorations = []
    }


fromAttributes : List (Attribute msg) -> Props
fromAttributes =
    let
        f act acc =
            case act of
                TypographyType x ->
                    { acc | type_ = x }

                TypographyDisabled ->
                    { acc | disabled = True }

                TypographyDecoration x ->
                    { acc | decorations = x :: acc.decorations }

                None ->
                    acc
    in
    List.foldl f defaultProps
