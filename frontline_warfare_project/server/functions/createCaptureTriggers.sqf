
private "_markersArray";

if !(isServer) exitWith {};

_markersArray = call allZoneMarkers;

{
   _marker = _x;
   
   _trig = createTrigger ["EmptyDetector", markerPos _marker];
   _trig setVariable ["captureTriggerMarker", _marker, true];
   
   

} forEach _markersArray;