module Main exposing (..)

import Either exposing (..)
import Html exposing (..)
import Maybe exposing (withDefault)
import String exposing (fromInt)


myVar : Either String Int
myVar =
    Left "Hello"


myVar2 : Either String Int
myVar2 =
    Right 4


myVar3 : Either (Either Float Int) (Either String (List String))
myVar3 =
    Right (Left "This is cool")


myVar4 : List (Either String Int)
myVar4 =
    [ Left "Hello", Right 5, Left "Holla", Left "Yes", Right 201636415 ]


myVar5 : List (Either String Int)
myVar5 =
    [ Left "Hello", Left "There", Left "My", Left "Favorite", Left "Language", Left "Is", Left "Elm" ]


main : Html msg
main =
    pre
        []
        [ text <| withDefault "Nothing" <| left myVar
        , text <| fromInt <| withDefault -1 <| right myVar2
        , text <| fromInt <| withDefault -1 <| right myVar
        , text <| fromInt <| rightI -1 myVar2
        , text <| fromInt <| rightI -1 myVar
        , text <| leftI "This is not cool" <| rightI (Left "This is not cool") myVar3
        , text <| rightI "Oops" <| flip (Left "Success!")
        , text <| boolToString <| allSameSide <| myVar4
        , text <| boolToString <| allSameSide <| myVar5
        ]


boolToString : Bool -> String
boolToString bool =
    case bool of
        True ->
            "True"

        False ->
            "False"
