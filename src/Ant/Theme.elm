module Ant.Theme exposing (..)

import Ant.ThemeValues as Values exposing (..)
import Element exposing (rgba255)


colors =
    { primary = primary_color
    , info = primary_color
    , success = success_color
    , processing = processing_color
    , error = error_color
    , highlight = highlight_color
    , warning = warning_color
    , normal = normal_color
    , white = white
    , black = black
    , primary1 = primary_1
    , primary2 = primary_2
    , primary3 = primary_3
    , primary4 = primary_4
    , primary5 = primary_5
    , primary6 = primary_6
    , primary7 = primary_7
    , primary8 = primary_8
    , primary9 = primary_9
    , primary10 = primary_10
    }


button =
    { border =
        { radius = btn_border_radius_base
        , width = btn_border_width
        , shadow =
            { offset = ( 0, 2 )
            , size = 0
            , blur = 0
            , color = rgba255 0x00 0x00 0x00 0.015
            }
        }
    , color =
        { font = btn_default_color
        , background = btn_default_bg
        , border = btn_default_bg
        }
    , font =
        { size = font_size_base
        , weight = btn_font_weight
        }
    , size =
        { height = btn_height_base
        }
    , position =
        { paddingX = btn_padding_horizontal_base
        }
    }


buttonPrimary =
    let
        border =
            button.border
    in
    { button
        | color =
            { font = btn_primary_color
            , background = btn_primary_bg
            , border = btn_primary_bg
            }
        , border =
            { border
                | shadow =
                    { offset = ( 0, 2 )
                    , size = 0
                    , blur = 0
                    , color = rgba255 0x00 0x00 0x00 0.045
                    }
            }
    }


theme =
    { name = Values.theme
    , colors = colors
    }
