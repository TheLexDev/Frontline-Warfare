//Functions

//[zone, array]
_selectCurrentZone = {
   private ["_array", "_finalArray", "_zone"];
   _zone = _this select 0;
   _array = _this select 1;
   _finalArray = [];
   {
      if ((_x select 0) == _zone) then
	  {
	     _finalArray pushBack _x;
	  };
   } forEach _array;
   
   _finalArray;
   //[zone, player]
};

//[zone]
_checkCapturingStatus = {
    private ["_zone", "_status"];
	
	_zone = _this select 0;
	_status = missionNamespace getVariable [format ["isCapturing_%1", _zone], false];
	_status;
};


//Start Loop

while {true} do 
{
    
	_playersArray = [];
	
	//Collect players in array who are into the triggers
	{
	   
	   if  (alive _x) then 
	   {
	   _player = _x;
	   _zone = _player getVariable ["TERRITORY_OCCUPATION", ""];
	   
	   if (_zone != "") then 
	   {
	      _playersArray pushBack [_zone, _player];
	   };
	   
	   };
	   
	} forEach playableUnits; //"allPlayers" just for testing in editor. Don't forget to change it with playableUnits!
	
	_currentZoneArray = "";
	
	
	
	for "_i" from 1 to 20 do
	{
	    if (count _playersArray > 0) then
		{
		  
		  //in case with non empty array
		  //in case there are no players in all zones
		  //
		  //
		  _currentZoneArray = [format ["zone%1", _i], _playersArray] call _selectCurrentZone;
		  //
          //
		  
			if (count _currentZoneArray > 0) then
			{
			//in case there are some players in current zone
			
			_opfSide = 0;
			_blufSide = 0;
			_winSide = "";
			
			//counting players in current zone
			{
			      switch (side (_x select 1)) do
				  {
				       case west: {_blufSide = _blufSide + 1;};
					   case east: {_opfSide = _opfSide + 1;};
				  };
			} forEach _currentZoneArray;
			
			//check winning side
			switch (true) do
			{
			      case (_blufSide > _opfSide): {_winSide = "blufor";};
				  case (_blufSide < _opfSide): {_winSide = "opfor";};
				  case (_blufSide == _opfSide): {_winSide = "neutral";};
				  default {_winSide = "neutral"};
			};
			
			//capturing message
			/*
			if !(missionNamespace getVariable [format ["isCapturing_zone%1", _i], "true"]) then {
			        
					if (_winSide == "blufor") then {msgSide = BLUFOR;} else {msgSide = OPFOR;};
					["FD_CP_Not_Clear_F", "playSound", msgSide, true, false] call BIS_fnc_MP;
					[{titleText ["You're capturing the zone!", "PLAIN", 1];}, "BIS_fnc_spawn", msgSide, true, false] call BIS_fnc_MP;
					};
					
				*/
			_score = missionNamespace getVariable [format ["score_zone%1", _i], 0];
			_currentZone = format ["zone%1", _i];
			_isCapturing = missionNamespace getVariable [format ["isCapturing_zone%1", _i], false];
			missionNamespace setVariable [format ["winSide_zone%1", _i], _winSide, true];
			
			switch (_winSide) do
 			{
			      case "blufor": {
                     				  if (_score < 100) then 
				                        {
											if !(_isCapturing) then {
											     missionNamespace setVariable [format ["isCapturing_zone%1", _i], true, true];
											     [_currentZone, _i] spawn captureProcess;
											};
											
										};
				  
				                 };
				  case "opfor":  {
                                       if (_score > -100) then
									     {
										     if !(_isCapturing) then {
											     missionNamespace setVariable [format ["isCapturing_zone%1", _i], true, true];
											     [_currentZone, _i] spawn captureProcess;
												 };
										 };
                                 };
                  case "neutral": {
                                       missionNamespace setVariable [format ["isCapturing_zone%1", _i], false, true];
                                  };				  
			};
			
			
			     
			} else
			{
			//
			//it'll be some function here later
			//
			//
			missionNamespace setVariable [format ["winSide_zone%1", _i], "neutral", true];
			missionNamespace setVariable [format ["isCapturing_zone%1", _i], false, true];
			};
		
		} else 
		{
		//in case with no players in array
		//in case there are no players in current zone
		//it will be some function here later
		//
		//
		missionNamespace setVariable [format ["winSide_zone%1", _i], "neutral", true];
		missionNamespace setVariable [format ["isCapturing_zone%1", _i], false, true];
		};
			
	
	};
		
//loop sleep timer
sleep 3;


};

//End Loop