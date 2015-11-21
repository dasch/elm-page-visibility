module PageVisibility (VisibilityState (..), visibility) where

{-| Library for using the Page Visibility API.

# Visibility Changes
@docs VisibilityState, visibility

-}

import Native.PageVisibility


{-| The possible visibility states.

* `Hidden` when the document is not visible at all on any screen.
* `Visible` when the document is at least partially visible on at least one screen.
* `Prerender` when the document is loaded in the prerender mode and is not yet visible.

-}
type VisibilityState = Hidden | Visible | Prerender


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

          _ ->
            -- crash hard here?
            Visible
  in
      Signal.map mapVisibility Native.PageVisibility.visibility
