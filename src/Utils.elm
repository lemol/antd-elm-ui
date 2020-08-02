module Utils exposing (style)

import Element
import Html.Attributes


style : String -> String -> Element.Attribute msg
style key value =
    Html.Attributes.style key value
        |> Element.htmlAttribute
