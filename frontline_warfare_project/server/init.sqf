//server init

if (!isServer && hasInterface) exitWith {};

[] execVM "server\functions\setupMarkers.sqf";

//Create capture triggers
call compile preprocessFileLineNumbers "server\functions\createCaptureTriggers.sqf";

//Create capture monitor

call compile preprocessFileLineNumbers "server\functions\monitorTerritory.sqf";