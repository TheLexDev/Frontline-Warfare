


if (!hasInterface) exitWith {};

{
   _trig = _x;
   _marker = _trig getVariable ["captureTriggerMarker", ""];
   
   if (_marker != "") then
   {
        
		_markerSize = markerSize _marker;
		_onEnter = format ["player setVariable ['TERRITORY_OCCUPATION', '%1', true]", _marker];
		_onExit = 
		("
			if (player getVariable ['TERRITORY_OCCUPATION', ''] == '" + _marker + "') then
			{
				player setVariable ['TERRITORY_OCCUPATION', '', true];
				
			};
		");
		_trig setTriggerArea [_markerSize select 0, _markerSize select 1, markerDir _marker, false];
		_trig setTriggerActivation ["ANY", "PRESENT", true];
		_trig setTriggerStatements ["(vehicle player) in thislist", _onEnter, _onExit];
		
    };
} forEach allMissionObjects "EmptyDetector";