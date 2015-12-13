
_flagObjects = [];

{
	_marker = "zone" + str _x;
	_flagHandle = "FlagPole_F" createVehicle markerPos _marker;
	_flagSide = missionNamespace getVariable ["FL_Zone" + str _x, "Neutral"];
	switch (_flagSide) do
	{
		case "OPFOR": {_flagHandle setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";};
		case "BLUFOR": {_flagHandle setFlagTexture "\A3\Data_F\Flags\Flag_us_CO.paa";};
		case "Neutral": {};
	};	
	
	_flagObjects pushBack _flagHandle;
	
	_relPos = [[-0.0065918,-3.92578,-4.0097],[3.18433,0.00390625,-4.19755],[-3.45752,-0.394531,-3.75878],[-0.347656,3.18066,-4.05162]];
	_relDir = [0.0566286,263.844,91.3007,174.572];
	
	for "_i" from 1 to 4 do
	{
		//_bagFence = null;
		_pos = _relPos select (_i - 1);
		_bagFence = "Land_BagFence_Round_F" createVehicle [((markerPos _marker) select 0) + (_pos select 0),((markerPos _marker) select 1) + (_pos select 1)];
		_bagFence setDir (_relDir select (_i - 1));
	};	
} forEach [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

missionNamespace setVariable ["FL_flagObjects", _flagObjects, true];

//flag20 = "FlagPole_F" createVehicle markerPos "Spawn_mark1";
//flag20 setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
//"\A3\Data_F\Flags\Flag_us_CO.paa"