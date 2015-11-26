//client init
waitUntil {!isNil "FL_serverSetupComplete"};


waitUntil {!isNull player};
waitUntil {time > 0.1};

call compile preprocessFileLineNumbers "client\clientCompile.sqf";

[] execVM "client\functions\setupCaptureTriggers.sqf";

if (!isNil "client_initEH") then
	{
		player removeEventHandler ["Respawn", client_initEH];
	};
player addEventHandler ["Respawn", {removeAllWeapons (_this select 0); deleteVehicle (_this select 1); }];
player addEventHandler ["Killed", {deleteVehicle (_this select 0) }];	

waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", onKeyPress];