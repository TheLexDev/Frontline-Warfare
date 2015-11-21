//server init

if (!isServer && hasInterface) exitWith {};

[] execVM "server\functions\setupMarkers.sqf";

//Create capture triggers
call compile preprocessFileLineNumbers "server\functions\createCaptureTriggers.sqf";

FL_serverSetupComplete = compileFinal "true";
publicVariable "FL_serverSetupComplete";

//Create capture monitor
call compile preprocessFileLineNumbers "server\functions\monitorTerritory.sqf";
