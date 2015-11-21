# elm-page-visibility

Library for using the Page Visibility API in Elm.

```elm
import PageVisibility


model : Signal Model


simulation : Signal Model
simulation =
  Signal.map2 simulate PageVisibility.visible model


simulate : Bool -> Model -> Model
simulate isVisible model =
  if isVisible then
    step model
  else
    model
```
