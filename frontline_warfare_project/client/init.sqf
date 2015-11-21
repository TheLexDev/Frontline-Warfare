//client init
waitUntil {!isNil "FL_serverSetupComplete"};


waitUntil {!isNull player};
waitUntil {time > 0.1};

call compile preprocessFileLineNumbers "client\clientCompile.sqf";

[] execVM "client\functions\setupCaptureTriggers.sqf";

waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", onKeyPress];