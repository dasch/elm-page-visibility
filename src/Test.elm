import Graphics.Element exposing (show)
import PageVisibility exposing (..)


main =
  Signal.foldp logState [] PageVisibility.visible
    |> Signal.map show


logState visible log = (showVisibility visible) :: log


showVisibility visible =
  if visible then "visible" else "hidden"
