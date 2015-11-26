//server init

if (!isServer && hasInterface) exitWith {};

[] execVM "server\functions\setupMarkers.sqf";
[] execVM "server\functions\setupMissionObjects.sqf";

//Create capture triggers
call compile preprocessFileLineNumbers "server\functions\createCaptureTriggers.sqf";

FL_serverSetupComplete = compileFinal "true";
publicVariable "FL_serverSetupComplete";

addMissionEventHandler ["HandleDisconnect", {
	deleteVehicle (_this select 0);
	false
	}
];	

//Create capture monitor
call compile preprocessFileLineNumbers "server\functions\monitorTerritory.sqf";
