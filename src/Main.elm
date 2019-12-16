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

test = 
  [ 
    Panel 0 "hello"
    , Panel 1 "yikes" 
    , Panel 2 "ultra yikes"
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
  section [ Html.Attributes.class "main-1" ]
  [
    textarea [] [ text panel.text ]
  ]

allPanels : Model -> List (Html msg)
allPanels model =
  List.map singlePanel model

joinPanels : Model -> Html msg
joinPanels model =
  div [] (List.map singlePanel model)

view : Model -> Html Msg
view model =
  div [ Html.Attributes.class "main" ]
    [
      Html.node "link" [ Html.Attributes.rel "stylesheet", Html.Attributes.href "style.css" ] []
      , ( joinPanels model )
    ]
