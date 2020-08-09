module Component.Button exposing (Model, Msg(..), init, stories, update)

import Ant exposing (when)
import Ant.Button as Button exposing (circle, icon, loading)
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
    , isLoading : Bool
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
    , isLoading = False
    }



--- UPDATE


type Msg
    = KnobsChanged (Control KnobsModel)
    | ToggleLoading


update { updateKnobs } msg model =
    case msg of
        KnobsChanged knobs ->
            updateKnobs { model | knobs = knobs }

        ToggleLoading ->
            updateKnobs { model | isLoading = not model.isLoading }



-- STORIES


stories =
    ( "Button"
    , [ ( "Type", always types, PluginOptions.default )
      , ( "Size", sizes, PluginOptions.default |> withKnobs )
      , ( "Shape", shapes, PluginOptions.default )
      , ( "Icon", icons, PluginOptions.default )
      , ( "Loading", loadingButtons, PluginOptions.default )
      ]
    )


types : Element msg
types =
    Element.row
        [ Element.spacing 8
        ]
        [ Button.default
            []
            { onPress = Nothing
            , label = Element.text "Default Button"
            }
        , Button.primary
            []
            { onPress = Nothing
            , label = Element.text "Primary Button"
            }
        , Button.dashed
            []
            { onPress = Nothing
            , label = Element.text "Dashed Button"
            }
        , Button.text
            []
            { onPress = Nothing
            , label = Element.text "Text Button"
            }
        ]


sizes : Model -> Element msg
sizes model =
    let
        knobs =
            Debug.Control.currentValue model.knobs

        viewSizes sizeAttribute =
            Element.column
                [ Element.spacing 8 ]
                [ Element.row
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

                -- TODO: make all sizes look corect
                , Element.row
                    [ Element.spacing 8
                    ]
                    [ Button.primary
                        [ sizeAttribute
                        , icon (Icons.downloadOutlined [])
                        ]
                        { onPress = Nothing
                        , label = Element.none
                        }
                    , Button.primary
                        [ sizeAttribute
                        , icon (Icons.downloadOutlined [])
                        ]
                        { onPress = Nothing
                        , label = Element.none
                        }
                    , Button.primary
                        [ sizeAttribute
                        , Button.round
                        , icon (Icons.downloadOutlined [])
                        ]
                        { onPress = Nothing
                        , label = Element.none
                        }
                    , Button.primary
                        [ sizeAttribute
                        , Button.round
                        , icon (Icons.downloadOutlined [])
                        ]
                        { onPress = Nothing
                        , label = Element.text "Download"
                        }
                    , Button.primary
                        [ sizeAttribute
                        , icon (Icons.downloadOutlined [])
                        ]
                        { onPress = Nothing
                        , label = Element.text "Download"
                        }
                    ]
                ]
    in
    case knobs.size of
        Small ->
            viewSizes Button.small

        DefaultSize ->
            viewSizes Button.defaultSize

        Large ->
            viewSizes Button.large


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


loadingButtons : Model -> Element Msg
loadingButtons model =
    Element.column
        [ Element.spacing 8
        ]
        [ Element.row
            [ Element.spacing 8
            ]
            [ Button.primary
                [ loading
                ]
                { onPress = Nothing
                , label = Element.text "Loading"
                }
            , Button.primary
                [ loading
                , Button.small
                ]
                { onPress = Nothing
                , label = Element.text "Loading"
                }
            , Button.primary
                [ loading
                ]
                { onPress = Nothing
                , label = Element.none
                }
            ]
        , Element.row
            [ Element.spacing 8
            ]
            [ Button.primary
                [ loading
                    |> when model.isLoading
                    |> Button.fromMaybe
                ]
                { onPress = Just ToggleLoading
                , label = Element.text "Click me!"
                }
            , Button.primary
                [ loading
                    |> when model.isLoading
                    |> Button.fromMaybe
                , icon (Icons.poweroffOutlined [])
                ]
                { onPress = Just ToggleLoading
                , label = Element.text "Click me!"
                }
            , Button.primary
                [ loading
                    |> when model.isLoading
                    |> Button.fromMaybe
                , icon (Icons.poweroffOutlined [])
                ]
                { onPress = Just ToggleLoading
                , label = Element.none
                }
            ]
        ]
