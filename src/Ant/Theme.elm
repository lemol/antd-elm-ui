module Ant.Theme exposing (..)

import Ant.ThemeValues as Values


body =
    Values.body


button_default =
    Values.btn


button_primary =
    let
        border =
            button_default.border
    in
    { button_default
        | backgroundColor = Values.btn_primary.backgroundColor
        , fontColor = Values.btn_primary.fontColor
        , border =
            { border
                | color = Values.btn_primary.border.color
            }
        , shadow = button_default.shadow
    }


button_dashed =
    let
        border =
            button_default.border
    in
    { button_default
        | backgroundColor = Values.btn_dashed.backgroundColor
        , fontColor = Values.btn_dashed.fontColor
        , border =
            { border
                | color = Values.btn_dashed.border.color
                , style = Values.btn_dashed.border.style
            }
        , shadow = button_default.shadow
    }


button_text =
    let
        border =
            button_default.border
    in
    { button_default
        | backgroundColor = Values.btn_text.backgroundColor
        , fontColor = Values.btn_text.fontColor
        , border =
            { border
                | color = Values.btn_text.border.color
            }
        , shadow = button_default.shadow
    }
