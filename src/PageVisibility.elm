module PageVisibility (visible, hidden) where

{-| Library for using the Page Visibility API.

This example only runs the simulation while the document is visible:

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

# Visibility Changes
@docs visible, hidden

-}

import Native.PageVisibility


{-| The possible visibility states.

* `Hidden` when the document is not visible at all on any screen.
* `Visible` when the document is at least partially visible on at least one screen.
* `Prerender` when the document is loaded in the prerender mode and is not yet visible.
* `Unloaded` when the page is being unloaded from memory.

-}
type VisibilityState = Visible | Hidden | Prerender | Unloaded


{-| A signal of visibility changes.
-}
visibility : Signal VisibilityState
visibility =
  let
      mapVisibility state =
        case state of
          "hidden" ->
            Hidden

          "visible" ->
            Visible

          "prerender" ->
            Prerender

          "unloaded" ->
            Unloaded

          _ ->
            -- crash hard here?
            Visible
  in
      Signal.map mapVisibility nativeVisibility


{-| A signal that is True when the page is visible.
-}
visible : Signal Bool
visible =
  Signal.map (\state -> state == Visible) visibility


{-| A signal that is True when the page is hidden or still being rendered.
-}
hidden : Signal Bool
hidden =
  Signal.map (\state -> state /= Visible) visibility


nativeVisibility : Signal String
nativeVisibility = Native.PageVisibility.visibility
