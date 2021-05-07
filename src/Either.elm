module Either exposing (Either(..), Side(..), allSameSide, flip, left, leftI, lefts, right, rightI, rights, sameSide, side)

{-| This module implements 'Either' like in Haskell.
-}

import List exposing (concatMap, head, map)
import Maybe exposing (withDefault)



-- Either


{-| Actuall type declaration
-}
type Either a b
    = Left a
    | Right b



-- Deconstructing


{-| Decodes the left side of an Either statement. Will return Nothing if the
variable is on the right.

Similar to [`right`](#right).

-}
left : Either a b -> Maybe a
left var =
    case var of
        Left a ->
            Just a

        Right _ ->
            Nothing


{-| Decodes the right side of an Either statement. Will return Nothing if the
variable is on the left.

Similar to [`left`](#left).

-}
right : Either a b -> Maybe b
right var =
    case var of
        Left _ ->
            Nothing

        Right b ->
            Just b


{-| Like [`left`](#left), but insured. If the variable is on the right side, a given value will be returned instead.
-}
leftI : a -> Either a b -> a
leftI insurance var =
    case var of
        Left a ->
            a

        Right _ ->
            insurance


{-| Like [`right`](#right), but insured. If the variable is on the left side, a given value will be returned instead.
-}
rightI : b -> Either a b -> b
rightI insurance var =
    case var of
        Left _ ->
            insurance

        Right b ->
            b



-- Sides


{-| This is like an enum declaration for which side is active in an Either variable.
They can not be `Left` and `Right`, because those constructors are already taken by
the above `Either` declaration.
-}
type Side
    = Former
    | Latter


{-| Returns which side of the variable is active.
-}
side : Either a b -> Side
side var =
    case var of
        Left _ ->
            Former

        Right _ ->
            Latter


{-| Checks if the Either variable is on a given side.
-}
isOnSide : Side -> Either a b -> Bool
isOnSide side_ var =
    side var == side_


{-| Checks if two Either variables are active on the same side.
-}
sameSide : Either a b -> Either c d -> Bool
sameSide var1 var2 =
    side var1 == side var2


{-| Checks if ALL the Either variables are on the same side.
-}
allSameSide : List (Either a b) -> Bool
allSameSide list =
    case list of
        [] ->
            False

        [ a ] ->
            True

        now :: xs ->
            if not <| sameSide now <| withDefault now <| head xs then
                False

            else
                allSameSide xs



-- Lists


{-| Gets all the left values of a list of Either variables.
-}
lefts : List (Either a b) -> List a
lefts eithers =
    concatMap
        (\n ->
            case n of
                Left a ->
                    [ a ]

                Right _ ->
                    []
        )
        eithers


{-| Gets all the right values of a list of Either variables.
-}
rights : List (Either a b) -> List b
rights eithers =
    concatMap
        (\n ->
            case n of
                Left _ ->
                    []

                Right b ->
                    [ b ]
        )
        eithers



-- Misc


{-| Flips the sides around, so that a becomes b and b becomes a.
-}
flip : Either a b -> Either b a
flip var =
    let
        making : Either b a
        making =
            case var of
                Left a ->
                    Right a

                Right b ->
                    Left b
    in
    making
