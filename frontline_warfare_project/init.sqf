//main init

#define DEBUG false

enableSaving [false, false];

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

[] execVM "markersConfig.sqf";

if (isServer) then {
      [] execVM "server\init.sqf";
	 
};
if !(isDedicated) then {
    [] spawn
       {    
            if (hasInterface) then {
	             
				 waitUntil {!isNull player};
				 
				 player setVariable ["playerSpawning", true, true];
				 playerSpawning = true;
				 
				 removeAllWeapons player;
				 
				 client_initEH = player addEventHandler ["Respawn", {removeAllWeapons (_this select 0) }];
				 
				 [player] joinSilent createGroup playerSide;
				 
				 [] execVM "client\init.sqf";
		    };
		};	
};