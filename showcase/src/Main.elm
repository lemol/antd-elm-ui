module Main exposing (main)

import Ant
import Component.Button as Button
import Component.Icon as Icon
import Component.Typography as Typography
import Debug.Control exposing (choice, field, record, string, value)
import Element exposing (Element)
import Html exposing (Html)
import PluginOptions exposing (PluginOptions)
import UIExplorer
    exposing
        ( Config
        , UIExplorerProgram
        , category
        , createCategories
        , defaultConfig
        , exploreWithCategories
        , logoFromUrl
        , storiesOf
        )
import UIExplorer.Plugins.Knobs as KnobsPlugin
import UIExplorer.Plugins.Tabs as TabsPlugin
import UIExplorer.Plugins.Tabs.Icons as TabsIconsPlugin



-- MODEL


type alias Model =
    { tabs : TabsPlugin.Model
    , button : Button.Model
    }


init : Model
init =
    { tabs = TabsPlugin.initialModel
    , button = Button.init
    }



-- MESSAGES


type Msg
    = TabMsg TabsPlugin.Msg
    | ButtonMsg Button.Msg



-- CONFIG


header =
    Just
        { title = "Ant Design Elm-UI"
        , logo = logoFromUrl "ant-design-elm-ui.png"
        , titleColor = Just "#FFFFFF"
        , bgColor = Just "#22292f"
        }


viewEnhancer m stories =
    Html.div []
        [ stories
        , TabsPlugin.view m.colorMode
            m.customModel.tabs
            [ ( "Knobs"
              , KnobsPlugin.viewEnhancer m
                    (\model option ->
                        viewKnobs model
                    )
              , TabsIconsPlugin.note
              )
            ]
            TabMsg
        ]


viewKnobs model =
    case ( model.selectedCategory, model.selectedUIId, model.selectedStoryId ) of
        ( Just "General", Just "Button", Just "Size" ) ->
            KnobsPlugin.viewKnobsForUI model (Button.KnobsChanged >> ButtonMsg) (\m -> m.button.knobs)

        _ ->
            Html.text "EMPTY"


config : Config Model Msg PluginOptions
config =
    { customHeader = header
    , customModel = init
    , subscriptions = \_ -> Sub.none
    , update = update
    , viewEnhancer = viewEnhancer
    , menuViewEnhancer = \m v -> v
    , onModeChanged = Nothing
    }



-- UPDATE


update : Msg -> UIExplorer.Model Model Msg PluginOptions -> ( UIExplorer.Model Model Msg PluginOptions, Cmd Msg )
update msg model =
    let
        customModel =
            model.customModel
    in
    case msg of
        TabMsg submsg ->
            ( { model | customModel = { customModel | tabs = TabsPlugin.update submsg model.customModel.tabs } }, Cmd.none )

        ButtonMsg subMsg ->
            Button.update
                { updateKnobs =
                    \modelUpdated ->
                        KnobsPlugin.updateKnobs model customModel <| \c -> { c | button = modelUpdated }
                }
                subMsg
                customModel.button


main : UIExplorerProgram Model Msg PluginOptions
main =
    exploreWithCategories
        config
        (createCategories
            |> category
                "General"
                generalStories
        )


generalStories =
    [ storiesOf
        (Tuple.first Button.stories)
        (Tuple.second Button.stories
            |> List.map
                (\( name, viewF, opts ) ->
                    ( name
                    , \model ->
                        let
                            storyModel =
                                model.customModel.button
                        in
                        viewF storyModel
                            |> toHtml
                            |> Html.map ButtonMsg
                    , opts
                    )
                )
        )
    , storiesOf
        (Tuple.first Icon.stories)
        (Tuple.second Icon.stories
            |> List.map
                (\( name, viewF, opts ) ->
                    ( name
                    , \model ->
                        viewF |> toHtml
                    , opts
                    )
                )
        )
    , storiesOf
        (Tuple.first Typography.stories)
        (Tuple.second Typography.stories
            |> List.map
                (\( name, viewF, opts ) ->
                    ( name
                    , \model ->
                        viewF |> toHtml
                    , opts
                    )
                )
        )
    ]


toHtml : Element msg -> Html msg
toHtml =
    Ant.layout [ Element.width Element.fill ]
