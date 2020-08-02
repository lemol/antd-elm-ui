module PluginOptions exposing (..)


type alias PluginOptions =
    { knobs : Bool
    }


default : PluginOptions
default =
    { knobs = False
    }


withKnobs : PluginOptions -> PluginOptions
withKnobs options =
  { options | knobs = True }
