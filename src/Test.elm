import Graphics.Element exposing (show)
import PageVisibility exposing (..)


main =
  Signal.foldp logState [] PageVisibility.visibility
    |> Signal.map show


logState state log = (showVisibility state) :: log


showVisibility visibility =
  case visibility of
    Visible -> "visible"
    Hidden -> "hidden"
    Prerender -> "prerender"
