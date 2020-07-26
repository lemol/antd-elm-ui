module Ant.ThemeValues exposing (body, btn, btn__active, btn__focus, btn__hover, btn__lg, btn__sm, btn_dashed, btn_dashed__active, btn_dashed__focus, btn_dashed__hover, btn_primary, btn_primary__active, btn_primary__focus, btn_primary__hover, btn_text, btn_text__active, btn_text__focus, btn_text__hover)

import Element exposing (Color, rgb255, rgba255)
import Element.Border as Border
import Element.Font as Font


body =
    { height = 100
    , width = 100
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


btn__active =
    { backgroundColor = rgb255 255 255 255
    , fontColor = rgb255 9 109 217
    , border = { color = rgb255 9 109 217 }
    }


btn__focus =
    { backgroundColor = rgb255 255 255 255
    , fontColor = rgb255 64 169 255
    , border = { color = rgb255 64 169 255 }
    }


btn__lg =
    { height = 40
    , paddingTop = 6
    , paddingRight = 15
    , paddingBottom = 6
    , paddingLeft = 15
    , fontSize = 16
    , border = { radius = 2 }
    }


btn__sm =
    { height = 24
    , paddingTop = 0
    , paddingRight = 7
    , paddingBottom = 0
    , paddingLeft = 7
    , fontSize = 14
    , border = { radius = 2 }
    }


btn__hover =
    { backgroundColor = rgb255 255 255 255
    , fontColor = rgb255 64 169 255
    , border = { color = rgb255 64 169 255 }
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


btn_primary__hover =
    { backgroundColor = rgb255 64 169 255
    , fontColor = rgb255 255 255 255
    , border = { color = rgb255 64 169 255 }
    }


btn_primary__focus =
    { backgroundColor = rgb255 64 169 255
    , fontColor = rgb255 255 255 255
    , border = { color = rgb255 64 169 255 }
    }


btn_primary__active =
    { backgroundColor = rgb255 9 109 217
    , fontColor = rgb255 255 255 255
    , border = { color = rgb255 9 109 217 }
    }


btn_dashed =
    { backgroundColor = rgb255 255 255 255
    , fontColor = rgba255 0 0 0 0.65
    , border =
        { style = Border.dashed
        , color = rgb255 217 217 217
        }
    }


btn_dashed__hover =
    { backgroundColor = rgb255 255 255 255
    , fontColor = rgb255 64 169 255
    , border = { color = rgb255 64 169 255 }
    }


btn_dashed__focus =
    { backgroundColor = rgb255 255 255 255
    , fontColor = rgb255 64 169 255
    , border = { color = rgb255 64 169 255 }
    }


btn_dashed__active =
    { backgroundColor = rgb255 255 255 255
    , fontColor = rgb255 9 109 217
    , border = { color = rgb255 9 109 217 }
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


btn_text__hover =
    { backgroundColor = rgba255 0 0 0 0
    , fontColor = rgb255 64 169 255
    , border = { color = rgba255 0 0 0 0 }
    }


btn_text__focus =
    { backgroundColor = rgba255 0 0 0 0
    , fontColor = rgb255 64 169 255
    , border = { color = rgba255 0 0 0 0 }
    }


btn_text__active =
    { backgroundColor = rgba255 0 0 0 0
    , fontColor = rgb255 9 109 217
    , border = { color = rgba255 0 0 0 0 }
    }
