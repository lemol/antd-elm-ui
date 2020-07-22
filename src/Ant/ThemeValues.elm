module Ant.ThemeValues exposing (btn)

import Element exposing (Color, rgb255, rgba255)
import Element.Border as Border
import Element.Font as Font


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
