Elm.Native.PageVisibility = {};
Elm.Native.PageVisibility.make = function(localRuntime) {
  localRuntime.Native = localRuntime.Native || {};
  localRuntime.Native.PageVisibility = localRuntime.Native.PageVisibility || {};

  if (localRuntime.Native.PageVisibility.values)
  {
    return localRuntime.Native.PageVisibility.values;
  }

  var eventName = "visibilitychange"
  var NS = Elm.Native.Signal.make(localRuntime);
  var stream = NS.input(eventName, document.visibilityState);
  var fallbackState = "visible";

  localRuntime.addListener([stream.id], document, eventName, function(e) {
    localRuntime.notify(stream.id, document.visibilityState || fallbackState);
  });

  return localRuntime.Native.PageVisibility.values = {
    visibility: stream
  };
};
