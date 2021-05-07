# Either Elm

The first time I tried Functional Programming, I thought "What the hell is this? Why would anybody program this way?" Then, I tried it out a little more. Then I realized how fun it is. Particularly the genius that comes with having to be resourceful. In no instance is that clearer than Haskell's `Maybe` and `Either` declarations.

```Haskell
type Maybe a
    = Just a
    | Nothing

type Either a b
    = Left a
    | Right b
```

Although `Maybe` is implemented in Elm, `Either` is not; until now. This module contains a declaration of Haskell's `Either` type, verbatim from the source code of the GHC library. It also contains a couple of other functions related to the declaration.

Just do

```
elm install kingwither/either
```

and the package will be installed!

```Elm
import Either exposing (Either(..))
```

You're all set! `Either` is now `Either Haskell Elm`!
