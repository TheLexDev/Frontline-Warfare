
#define DEBUG false

enableSaving [false, false];

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

[] execVM "markersConfig.sqf";

if (isServer) then {
      [] execVM "server\init.sqf";
	 
};
if !(isDedicated) then {
     [] execVM "client\init.sqf";
};