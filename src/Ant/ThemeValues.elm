module Ant.ThemeValues exposing (..)

import Ant.Color as Color
import Element exposing (Color, rgb255, rgba255)


theme : String
theme =
  "default"


ant_prefix : String
ant_prefix =
  "ant"


html_selector : String
html_selector =
  "html"


primary_color : Color
primary_color =
  Color.blue6


info_color : Color
info_color =
  Color.blue6


success_color : Color
success_color =
  Color.green6


processing_color : Color
processing_color =
  Color.blue6


error_color : Color
error_color =
  Color.red5


highlight_color : Color
highlight_color =
  Color.red5


warning_color : Color
warning_color =
  Color.gold6


normal_color : Color
normal_color =
  rgb255 0xd9 0xd9 0xd9


white : Color
white =
  rgb255 0xff 0xff 0xff


black : Color
black =
  rgb255 0x00 0x00 0x00


primary_1 : Color
primary_1 =
  rgb255 0xe6 0xf6 0xff


primary_2 : Color
primary_2 =
  rgb255 0xad 0xe0 0xff


primary_3 : Color
primary_3 =
  rgb255 0x85 0xcc 0xff


primary_4 : Color
primary_4 =
  rgb255 0x57 0xac 0xf2


primary_5 : Color
primary_5 =
  rgb255 0x2e 0x8d 0xe6


primary_6 : Color
primary_6 =
  rgb255 0x09 0x6d 0xd9


primary_7 : Color
primary_7 =
  rgb255 0x00 0x50 0xb3


primary_8 : Color
primary_8 =
  rgb255 0x00 0x3a 0x8c


primary_9 : Color
primary_9 =
  rgb255 0x00 0x27 0x66


primary_10 : Color
primary_10 =
  rgb255 0x00 0x16 0x40


body_background : Color
body_background =
  rgb255 0xff 0xff 0xff


component_background : Color
component_background =
  rgb255 0xff 0xff 0xff


popover_background : Color
popover_background =
  rgb255 0xff 0xff 0xff


popover_customize_border_color : Color
popover_customize_border_color =
  rgba255 0xff 0xff 0xff 1


font_family : String
font_family =
  "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial', 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'"


code_family : String
code_family =
  "'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, Courier, monospace"


text_color : Color
text_color =
  rgba255 0x00 0x00 0x00 0.6509803921568628


text_color_secondary : Color
text_color_secondary =
  rgba255 0x00 0x00 0x00 0.45098039215686275


text_color_inverse : Color
text_color_inverse =
  rgb255 0xff 0xff 0xff


icon_color : String
icon_color =
  "inherit"


icon_color_hover : Color
icon_color_hover =
  rgba255 0x00 0x00 0x00 0.7490196078431373


heading_color : Color
heading_color =
  rgba255 0x00 0x00 0x00 0.8509803921568627


heading_color_dark : Color
heading_color_dark =
  rgba255 0xff 0xff 0xff 1


text_color_dark : Color
text_color_dark =
  rgba255 0xff 0xff 0xff 0.8509803921568627


text_color_secondary_dark : Color
text_color_secondary_dark =
  rgba255 0xff 0xff 0xff 0.6509803921568628


text_selection_bg : Color
text_selection_bg =
  Color.blue6


font_variant_base : String
font_variant_base =
  "tabular-nums"


font_feature_settings_base : String
font_feature_settings_base =
  "tnum"


font_size_base : Int
font_size_base =
  14


font_size_lg : Int
font_size_lg =
  12


font_size_sm : Int
font_size_sm =
  12


heading_1_size : Int
heading_1_size =
  38


heading_2_size : Int
heading_2_size =
  30


heading_3_size : Int
heading_3_size =
  24


heading_4_size : Int
heading_4_size =
  20


line_height_base : Float
line_height_base =
  1.5715


border_radius_base : Int
border_radius_base =
  2


border_radius_sm : Int
border_radius_sm =
  2


padding_lg : Int
padding_lg =
  24


padding_md : Int
padding_md =
  16


padding_sm : Int
padding_sm =
  12


padding_xs : Int
padding_xs =
  8


padding_xss : Int
padding_xss =
  4


control_padding_horizontal : Int
control_padding_horizontal =
  12


control_padding_horizontal_sm : Int
control_padding_horizontal_sm =
  8


margin_lg : Int
margin_lg =
  24


margin_md : Int
margin_md =
  16


margin_sm : Int
margin_sm =
  12


margin_xs : Int
margin_xs =
  8


margin_xss : Int
margin_xss =
  4


height_base : Int
height_base =
  32


height_lg : Int
height_lg =
  40


height_sm : Int
height_sm =
  24


item_active_bg : Color
item_active_bg =
  rgb255 0xe6 0xf6 0xff


item_hover_bg : Color
item_hover_bg =
  rgb255 0xf5 0xf5 0xf5


iconfont_css_prefix : String
iconfont_css_prefix =
  "anticon"


link_color : Color
link_color =
  Color.blue6


link_hover_color : Color
link_hover_color =
  rgb255 0x2e 0x8d 0xe6


link_active_color : Color
link_active_color =
  rgb255 0x00 0x50 0xb3


link_decoration : String
link_decoration =
  "none"


link_hover_decoration : String
link_hover_decoration =
  "none"


link_focus_decoration : String
link_focus_decoration =
  "none"


link_focus_outline : String
link_focus_outline =
  "0"


ease_base_out : String
ease_base_out =
  "cubic-bezier(0.7, 0.3, 0.1, 1)"


ease_base_in : String
ease_base_in =
  "cubic-bezier(0.9, 0, 0.3, 0.7)"


ease_out : String
ease_out =
  "cubic-bezier(0.215, 0.61, 0.355, 1)"


ease_in : String
ease_in =
  "cubic-bezier(0.55, 0.055, 0.675, 0.19)"


ease_in_out : String
ease_in_out =
  "cubic-bezier(0.645, 0.045, 0.355, 1)"


ease_out_back : String
ease_out_back =
  "cubic-bezier(0.12, 0.4, 0.29, 1.46)"


ease_in_back : String
ease_in_back =
  "cubic-bezier(0.71, -0.46, 0.88, 0.6)"


ease_in_out_back : String
ease_in_out_back =
  "cubic-bezier(0.71, -0.46, 0.29, 1.46)"


ease_out_circ : String
ease_out_circ =
  "cubic-bezier(0.08, 0.82, 0.17, 1)"


ease_in_circ : String
ease_in_circ =
  "cubic-bezier(0.6, 0.04, 0.98, 0.34)"


ease_in_out_circ : String
ease_in_out_circ =
  "cubic-bezier(0.78, 0.14, 0.15, 0.86)"


ease_out_quint : String
ease_out_quint =
  "cubic-bezier(0.23, 1, 0.32, 1)"


ease_in_quint : String
ease_in_quint =
  "cubic-bezier(0.755, 0.05, 0.855, 0.06)"


ease_in_out_quint : String
ease_in_out_quint =
  "cubic-bezier(0.86, 0, 0.07, 1)"


border_color_base : Color
border_color_base =
  rgba255 0xff 0xff 0xff 1


border_color_split : Color
border_color_split =
  rgba255 0xff 0xff 0xff 1


border_color_inverse : Color
border_color_inverse =
  rgb255 0xff 0xff 0xff


border_width_base : Int
border_width_base =
  1


border_style_base : String
border_style_base =
  "solid"


outline_blur_size : String
outline_blur_size =
  "0"


outline_width : Int
outline_width =
  2


outline_color : Color
outline_color =
  Color.blue6


outline_fade : Int
outline_fade =
  20


background_color_light : Color
background_color_light =
  rgba255 0xff 0xff 0xff 1


background_color_base : Color
background_color_base =
  rgba255 0xff 0xff 0xff 1


disabled_color : Color
disabled_color =
  rgba255 0x00 0x00 0x00 0.25098039215686274


disabled_bg : Color
disabled_bg =
  rgba255 0xff 0xff 0xff 1


disabled_color_dark : Color
disabled_color_dark =
  rgba255 0xff 0xff 0xff 0.34901960784313724


shadow_color : Color
shadow_color =
  rgba255 0x00 0x00 0x00 0.14901960784313725


shadow_color_inverse : Color
shadow_color_inverse =
  rgb255 0xff 0xff 0xff


box_shadow_base : String
box_shadow_base =
  "0 3 6 -4 rgba(0, 0, 0, 0.12), 0 6 16 0 rgba(0, 0, 0, 0.08), 0 9 28 8 rgba(0, 0, 0, 0.05)"


shadow_1_up : String
shadow_1_up =
  "0 -6 16 -8 rgba(0, 0, 0, 0.08), 0 -9 28 0 rgba(0, 0, 0, 0.05), 0 -12 48 16 rgba(0, 0, 0, 0.03)"


shadow_1_down : String
shadow_1_down =
  "0 6 16 -8 rgba(0, 0, 0, 0.08), 0 9 28 0 rgba(0, 0, 0, 0.05), 0 12 48 16 rgba(0, 0, 0, 0.03)"


shadow_1_left : String
shadow_1_left =
  "-6 0 16 -8 rgba(0, 0, 0, 0.08), -9 0 28 0 rgba(0, 0, 0, 0.05), -12 0 48 16 rgba(0, 0, 0, 0.03)"


shadow_1_right : String
shadow_1_right =
  "6 0 16 -8 rgba(0, 0, 0, 0.08), 9 0 28 0 rgba(0, 0, 0, 0.05), 12 0 48 16 rgba(0, 0, 0, 0.03)"


shadow_2 : String
shadow_2 =
  "0 3 6 -4 rgba(0, 0, 0, 0.12), 0 6 16 0 rgba(0, 0, 0, 0.08), 0 9 28 8 rgba(0, 0, 0, 0.05)"


btn_font_weight : Int
btn_font_weight =
  400


btn_border_radius_base : Int
btn_border_radius_base =
  2


btn_border_radius_sm : Int
btn_border_radius_sm =
  2


btn_border_width : Int
btn_border_width =
  1


btn_border_style : String
btn_border_style =
  "solid"


btn_shadow : String
btn_shadow =
  "0 2 0 rgba(0, 0, 0, 0.015)"


btn_primary_shadow : String
btn_primary_shadow =
  "0 2 0 rgba(0, 0, 0, 0.045)"


btn_text_shadow : String
btn_text_shadow =
  "0 -1 0 rgba(0, 0, 0, 0.12)"


btn_primary_color : Color
btn_primary_color =
  rgb255 0xff 0xff 0xff


btn_primary_bg : Color
btn_primary_bg =
  Color.blue6


btn_default_color : Color
btn_default_color =
  rgba255 0x00 0x00 0x00 0.6509803921568628


btn_default_bg : Color
btn_default_bg =
  rgb255 0xff 0xff 0xff


btn_default_border : Color
btn_default_border =
  rgba255 0xff 0xff 0xff 1


btn_danger_color : Color
btn_danger_color =
  rgb255 0xff 0xff 0xff


btn_danger_bg : Color
btn_danger_bg =
  Color.red5


btn_danger_border : Color
btn_danger_border =
  Color.red5


btn_disable_color : Color
btn_disable_color =
  rgba255 0x00 0x00 0x00 0.25098039215686274


btn_disable_bg : Color
btn_disable_bg =
  rgba255 0xff 0xff 0xff 1


btn_disable_border : Color
btn_disable_border =
  rgba255 0xff 0xff 0xff 1


btn_default_ghost_color : Color
btn_default_ghost_color =
  rgb255 0xff 0xff 0xff


btn_default_ghost_bg : String
btn_default_ghost_bg =
  "transparent"


btn_default_ghost_border : Color
btn_default_ghost_border =
  rgb255 0xff 0xff 0xff


btn_font_size_lg : Int
btn_font_size_lg =
  12


btn_font_size_sm : Int
btn_font_size_sm =
  14


btn_padding_horizontal_base : Int
btn_padding_horizontal_base =
  17


btn_padding_horizontal_lg : Int
btn_padding_horizontal_lg =
  17


btn_padding_horizontal_sm : Int
btn_padding_horizontal_sm =
  9


btn_height_base : Int
btn_height_base =
  32


btn_height_lg : Int
btn_height_lg =
  40


btn_height_sm : Int
btn_height_sm =
  24


btn_circle_size : Int
btn_circle_size =
  32


btn_circle_size_lg : Int
btn_circle_size_lg =
  40


btn_circle_size_sm : Int
btn_circle_size_sm =
  24


btn_square_size : Int
btn_square_size =
  32


btn_square_size_lg : Int
btn_square_size_lg =
  40


btn_square_size_sm : Int
btn_square_size_sm =
  24


btn_square_only_icon_size : Int
btn_square_only_icon_size =
  12


btn_square_only_icon_size_sm : Int
btn_square_only_icon_size_sm =
  14


btn_group_border : Color
btn_group_border =
  rgb255 0x2e 0x8d 0xe6


btn_link_hover_bg : String
btn_link_hover_bg =
  "transparent"


btn_text_hover_bg : Color
btn_text_hover_bg =
  rgba255 0x00 0x00 0x00 0.0196078431372549