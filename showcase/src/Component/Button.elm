module Component.Button exposing (Model, Msg(..), init, stories, update)

import Ant
import Ant.Button as Button exposing (circle, icon)
import Ant.Icons as Icons
import Debug.Control exposing (Control, choice, field, record, string, value)
import Element exposing (Element)
import Html exposing (Html)
import PluginOptions exposing (withKnobs)
import UIExplorer exposing (storiesOf)



-- DATA


type Size
    = Small
    | DefaultSize
    | Large



-- MODEL


type alias KnobsModel =
    { size : Size
    }


type alias Model =
    { knobs : Control KnobsModel
    }


init : Model
init =
    { knobs =
        record KnobsModel
            |> field "size"
                (choice
                    [ ( "Small", value Small )
                    , ( "Default Size", value DefaultSize )
                    , ( "Large", value Large )
                    ]
                )
    }



--- UPDATE


type Msg
    = KnobsChanged (Control KnobsModel)


update { updateKnobs } msg model =
    case msg of
        KnobsChanged knobs ->
            updateKnobs { model | knobs = knobs }



-- STORIES


stories =
    ( "Button"
    , [ ( "Type", types, PluginOptions.default )
      , ( "Size", sizes, PluginOptions.default |> withKnobs )
      , ( "Shape", shapes, PluginOptions.default )
      , ( "Icon", icons, PluginOptions.default )
      ]
    )


types _ =
    buttonView Button.defaultSize


sizes : Model -> Element msg
sizes model =
    let
        knobs =
            Debug.Control.currentValue model.knobs
    in
    case knobs.size of
        Small ->
            buttonView Button.small

        DefaultSize ->
            buttonView Button.defaultSize

        Large ->
            buttonView Button.large


shapes : Model -> Element msg
shapes _ =
    Element.row
        [ Element.spacing 8
        ]
        [ Button.primary
            []
            { onPress = Nothing
            , label = Element.text "Default Shape"
            }
        , Button.primary
            [ circle
            , icon (Icons.searchOutlined [])
            ]
            { onPress = Nothing
            , label = Element.none
            }
        , Button.primary
            [ Button.round ]
            { onPress = Nothing
            , label = Element.text "Round"
            }
        ]


icons : Model -> Element msg
icons _ =
    Element.row
        [ Element.spacing 8
        ]
        [ Button.primary
            [ icon (Icons.searchOutlined [])
            , circle
            ]
            { onPress = Nothing
            , label = Element.none
            }
        , Button.primary
            [ circle ]
            { onPress = Nothing
            , label = Element.text "A"
            }
        , Button.primary
            [ icon (Icons.searchOutlined []) ]
            { onPress = Nothing
            , label = Element.text "Search"
            }
        , Button.default
            [ icon (Icons.searchOutlined [])
            , circle
            ]
            { onPress = Nothing
            , label = Element.none
            }
        , Button.default
            [ icon (Icons.searchOutlined []) ]
            { onPress = Nothing
            , label = Element.text "Search"
            }
        , Button.dashed
            [ icon (Icons.searchOutlined [])
            , circle
            ]
            { onPress = Nothing
            , label = Element.none
            }
        , Button.dashed
            [ icon (Icons.searchOutlined []) ]
            { onPress = Nothing
            , label = Element.text "Search"
            }
        ]



-- STORIES HELPERS


buttonView : Button.Attribute msg -> Element msg
buttonView sizeAttribute =
    Element.row
        [ Element.spacing 8
        ]
        [ Button.default
            [ sizeAttribute ]
            { onPress = Nothing
            , label = Element.text "Default Button"
            }
        , Button.primary
            [ sizeAttribute ]
            { onPress = Nothing
            , label = Element.text "Primary Button"
            }
        , Button.dashed
            [ sizeAttribute ]
            { onPress = Nothing
            , label = Element.text "Dashed Button"
            }
        , Button.text
            [ sizeAttribute ]
            { onPress = Nothing
            , label = Element.text "Text Button"
            }
        ]
