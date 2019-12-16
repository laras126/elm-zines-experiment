module Main exposing (..)

import Browser
import Html.Attributes exposing (..)
import Html exposing(Html, button, section, div, textarea, text)
import Html.Events exposing (onClick)
import List exposing (..)


-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Panel =
  { id : Int 
  , text : String
  }

type alias Model = List Panel

test : Model
test = 
  [ 
    Panel 0 "hello"
    , Panel 1 "yikes" 
    , Panel 2 "ultra yikes"
    , Panel 3 "ultra super yikes"
    , Panel 4 "ok can i write css now"
    , Panel 5 "no not yet but soon"
    , Panel 6 "ok can i write css now"
    , Panel 7 "no not yet but soon"
  ]

init : Model
init =
  test

-- UPDATE

type Msg
  = Add
  | Remove

update : Msg -> Model -> Model
update msg model =
  case msg of
    Add ->
      model
    Remove ->
      model
    

-- VIEW

singlePanel : Panel -> Html msg
singlePanel panel = 
  section [ Html.Attributes.class ( String.fromInt panel.id ) ]
  [
    textarea [] [ text ( String.concat [ String.fromInt panel.id, " - ", panel.text ] ) ]
  ]

allPanels : Model -> List (Html msg)
allPanels model =
  List.map singlePanel model

joinPanels : Model -> Html msg
joinPanels model =
  div [ Html.Attributes.class "panels" ] (List.map singlePanel model)

view : Model -> Html Msg
view model =
  div [] [
    Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href "style.css" ] []
    , joinPanels model
  ]
