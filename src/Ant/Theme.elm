module Ant.Theme exposing (..)

import Ant.ThemeValues as Values


body =
    Values.body


button_default =
    { normal = Values.btn
    , active = Values.btn__active
    , focus = Values.btn__focus
    , hover = Values.btn__hover
    , small = Values.btn__sm
    , large = Values.btn__lg
    , circle = Values.btn_circle
    , round = Values.btn_round
    }


button_primary =
    let
        default_normal =
            button_default.normal

        default_hover =
            button_default.hover

        default_active =
            button_default.active

        default_focus =
            button_default.focus
    in
    { button_default
        | normal =
            let
                border =
                    default_normal.border
            in
            { default_normal
                | backgroundColor = Values.btn_primary.backgroundColor
                , fontColor = Values.btn_primary.fontColor
                , border =
                    { border
                        | color = Values.btn_primary.border.color
                    }
            }
        , hover =
            let
                border =
                    default_hover.border
            in
            { default_hover
                | backgroundColor = Values.btn_primary__hover.backgroundColor
                , fontColor = Values.btn_primary__hover.fontColor
                , border =
                    { border
                        | color = Values.btn_primary__hover.border.color
                    }
            }
        , active =
            let
                border =
                    default_active.border
            in
            { default_active
                | backgroundColor = Values.btn_primary__active.backgroundColor
                , fontColor = Values.btn_primary__active.fontColor
                , border =
                    { border
                        | color = Values.btn_primary__active.border.color
                    }
            }
        , focus =
            let
                border =
                    default_focus.border
            in
            { default_focus
                | backgroundColor = Values.btn_primary__focus.backgroundColor
                , fontColor = Values.btn_primary__focus.fontColor
                , border =
                    { border
                        | color = Values.btn_primary__focus.border.color
                    }
            }
    }


button_dashed =
    let
        default_normal =
            button_default.normal

        default_hover =
            button_default.hover

        default_active =
            button_default.active

        default_focus =
            button_default.focus
    in
    { button_default
        | normal =
            let
                border =
                    default_normal.border
            in
            { default_normal
                | backgroundColor = Values.btn_dashed.backgroundColor
                , fontColor = Values.btn_dashed.fontColor
                , border =
                    { border
                        | color = Values.btn_dashed.border.color
                        , style = Values.btn_dashed.border.style
                    }
            }
        , hover =
            let
                border =
                    default_hover.border
            in
            { default_hover
                | backgroundColor = Values.btn_dashed__hover.backgroundColor
                , fontColor = Values.btn_dashed__hover.fontColor
                , border =
                    { border
                        | color = Values.btn_dashed__hover.border.color
                    }
            }
        , active =
            let
                border =
                    default_active.border
            in
            { default_active
                | backgroundColor = Values.btn_dashed__active.backgroundColor
                , fontColor = Values.btn_dashed__active.fontColor
                , border =
                    { border
                        | color = Values.btn_dashed__active.border.color
                    }
            }
        , focus =
            let
                border =
                    default_focus.border
            in
            { default_focus
                | backgroundColor = Values.btn_dashed__focus.backgroundColor
                , fontColor = Values.btn_dashed__focus.fontColor
                , border =
                    { border
                        | color = Values.btn_dashed__focus.border.color
                    }
            }
    }


button_text =
    let
        default_normal =
            button_default.normal

        default_hover =
            button_default.hover

        default_active =
            button_default.active

        default_focus =
            button_default.focus
    in
    { button_default
        | normal =
            let
                border =
                    default_normal.border
            in
            { default_normal
                | backgroundColor = Values.btn_text.backgroundColor
                , fontColor = Values.btn_text.fontColor
                , border =
                    { border
                        | color = Values.btn_text.border.color
                    }
            }
        , hover =
            let
                border =
                    default_hover.border
            in
            { default_hover
                | backgroundColor = Values.btn_text__hover.backgroundColor
                , fontColor = Values.btn_text__hover.fontColor
                , border =
                    { border
                        | color = Values.btn_text__hover.border.color
                    }
            }
        , active =
            let
                border =
                    default_active.border
            in
            { default_active
                | backgroundColor = Values.btn_text__active.backgroundColor
                , fontColor = Values.btn_text__active.fontColor
                , border =
                    { border
                        | color = Values.btn_text__active.border.color
                    }
            }
        , focus =
            let
                border =
                    default_focus.border
            in
            { default_focus
                | backgroundColor = Values.btn_text__focus.backgroundColor
                , fontColor = Values.btn_text__focus.fontColor
                , border =
                    { border
                        | color = Values.btn_text__focus.border.color
                    }
            }
    }
