module Ant.ThemeValues exposing (body, btn, btn_dashed, btn_primary, btn_text)

import Element exposing (Color, rgb255, rgba255)
import Element.Border as Border
import Element.Font as Font


body =
    { height = 100
    , backgroundColor = rgb255 255 255 255
    , fontColor = rgba255 0 0 0 0.65
    , fontSize = 14
    , fontVariant = Font.variantList [ Font.tabularNumbers ]
    , fontFamily =
        Font.family
            [ Font.typeface "-apple-system"
            , Font.typeface "BlinkMacSystemFont"
            , Font.typeface "Segoe UI"
            , Font.typeface "Roboto"
            , Font.typeface "Helvetica Neue"
            , Font.typeface "Arial"
            , Font.typeface "Noto Sans"
            , Font.sansSerif
            , Font.typeface "Apple Color Emoji"
            , Font.typeface "Segoe UI Emoji"
            , Font.typeface "Segoe UI Symbol"
            , Font.typeface "Noto Color Emoji"
            ]
    }


btn =
    { height = 32
    , paddingTop = 4
    , paddingRight = 15
    , paddingBottom = 4
    , paddingLeft = 15
    , backgroundColor = rgb255 255 255 255
    , fontColor = rgba255 0 0 0 0.65
    , fontSize = 14
    , fontWeight = Font.regular
    , fontAlign = Font.center
    , border =
        { width = 1
        , style = Border.solid
        , color = rgb255 217 217 217
        , radius = 2
        }
    , shadow =
        { offset = ( 0, 2 )
        , blur = 0
        , size = 0
        , color = rgba255 0 0 0 0.015
        }
    }


btn_primary =
    { backgroundColor = rgb255 24 144 255
    , fontColor = rgb255 255 255 255
    , border = { color = rgb255 24 144 255 }
    , shadow =
        { offset = ( 0, 2 )
        , blur = 0
        , size = 0
        , color = rgba255 0 0 0 0.045
        }
    }


btn_dashed =
    { backgroundColor = rgb255 255 255 255
    , fontColor = rgba255 0 0 0 0.65
    , border =
        { style = Border.dashed
        , color = rgb255 217 217 217
        }
    }


btn_text =
    { backgroundColor = rgba255 0 0 0 0
    , fontColor = rgba255 0 0 0 0.65
    , border = { color = rgba255 0 0 0 0 }
    , shadow =
        { offset = ( 0, 0 )
        , blur = 0
        , size = 0
        , color = rgba255 0 0 0 0
        }
    }
