
_ownerUpdate = {
    private ["_zoneMarkersArray", "_anotherZoneSide", "_zoneSide"];
	
	_id = _this select 0;
	
	if ((_this select 1) == "BLUFOR") then {   
	      ("zone" + str (_id)) setMarkerColor "ColorBlue";
		  ("mt_zone" + str (_id)) setMarkerColor "ColorBlue";
    } else {
          ("zone" + str (_id)) setMarkerColor "ColorRed";
		  ("mt_zone" + str (_id)) setMarkerColor "ColorRed";
    };	
    //main zone
	switch (_id) do {
		          case 1: {_zoneMarkersArray = call zone1;};
				  case 2: {_zoneMarkersArray = call zone2;};
				  case 3: {_zoneMarkersArray = call zone3;};
				  case 4: {_zoneMarkersArray = call zone4;};
				  case 5: {_zoneMarkersArray = call zone5;};
				  case 6: {_zoneMarkersArray = call zone6;};
				  case 7: {_zoneMarkersArray = call zone7;};
				  case 8: {_zoneMarkersArray = call zone8;};
				  case 9: {_zoneMarkersArray = call zone9;};
				  case 10: {_zoneMarkersArray = call zone10;};
				  case 11: {_zoneMarkersArray = call zone11;};
				  case 12: {_zoneMarkersArray = call zone12;};
				  case 13: {_zoneMarkersArray = call zone13;};
				  case 14: {_zoneMarkersArray = call zone14;};
				  case 15: {_zoneMarkersArray = call zone15;};
				  case 16: {_zoneMarkersArray = call zone16;};
				  case 17: {_zoneMarkersArray = call zone17;};
				  case 18: {_zoneMarkersArray = call zone18;};
				  case 19: {_zoneMarkersArray = call zone19;};
				  case 20: {_zoneMarkersArray = call zone20;};
				  case "opbase": {_zoneMarkersArray = call OPBASE;};
				  case "blubase": {_zoneMarkersArray = call BLUBASE;};
		
		};
	
	
	
	_countZonesArray = [];
	
	_countZonesArray pushBack _id;
	//getting list of zones
	{
	  if !((_x select 1) in _countZonesArray) then {
	         _element = _x select 1;
			 switch (typeName _element) do {
			     case "STRING": {if (_element != "any") then {_countZonesArray pushBack _element;};};
			     default {_countZonesArray pushBack _element;};
			 
			 };
	  };
	
	} forEach _zoneMarkersArray;
	//updating zones
    
	{
	    _element = _x;
		switch (_element) do {		
		   case "opbase": {_zoneSide = missionNamespace getVariable ["FL_OPBASE", "any"];};
		   case "blubase": {_zoneSide = missionNamespace getVariable ["FL_BLUBASE", "any"];};
		   default {_zoneSide = missionNamespace getVariable ["FL_Zone" + str _element, "any"];};
		 };  
		
		         
		           switch (_element) do {
		          case 1: {_zoneMarkersArray = call zone1;};
				  case 2: {_zoneMarkersArray = call zone2;};
				  case 3: {_zoneMarkersArray = call zone3;};
				  case 4: {_zoneMarkersArray = call zone4;};
				  case 5: {_zoneMarkersArray = call zone5;};
				  case 6: {_zoneMarkersArray = call zone6;};
				  case 7: {_zoneMarkersArray = call zone7;};
				  case 8: {_zoneMarkersArray = call zone8;};
				  case 9: {_zoneMarkersArray = call zone9;};
				  case 10: {_zoneMarkersArray = call zone10;};
				  case 11: {_zoneMarkersArray = call zone11;};
				  case 12: {_zoneMarkersArray = call zone12;};
				  case 13: {_zoneMarkersArray = call zone13;};
				  case 14: {_zoneMarkersArray = call zone14;};
				  case 15: {_zoneMarkersArray = call zone15;};
				  case 16: {_zoneMarkersArray = call zone16;};
				  case 17: {_zoneMarkersArray = call zone17;};
				  case 18: {_zoneMarkersArray = call zone18;};
				  case 19: {_zoneMarkersArray = call zone19;};
				  case 20: {_zoneMarkersArray = call zone20;};
				  case "opbase": {_zoneMarkersArray = call OPBASE;};
				  case "blubase": {_zoneMarkersArray = call BLUBASE;};
		
		          };
		           
		           {
////////////////////////////////////////////////////////////				        

						_mark = _x select 0;
		                _anotherZone = _x select 1;
		   
		                switch (_anotherZone) do {
		           
				             case "any": {_anotherZoneSide = "any";};
				             case "opbase": {_anotherZoneSide = "OPFOR";};
				             case "blubase": {_anotherZoneSide = "BLUFOR";};
				             default {_anotherZoneSide = missionNamespace getVariable ["FL_Zone" + str _anotherZone, "any"];};
		   
		                };
		   		   
		   
		                if (_zoneSide == _anotherZoneSide) then {
		                      _mark setMarkerBrush "DiagGrid";
                              if (_zoneSide == "OPFOR") then {_mark setMarkerColor "ColorRed";} else {_mark setMarkerColor "ColorBlue";};					
		                      } else {
		                      if (_anotherZoneSide != "any") then {
					                             _mark setMarkerBrush "Solid";
												 if (_zoneSide == "OPFOR") then {_mark setMarkerColor "ColorRed";} else {_mark setMarkerColor "ColorBlue";};
					                             };
					          if (_anotherZoneSide == "any") then {if (_zoneSide == "OPFOR") then {_mark setMarkerColor "ColorRed";} else {_mark setMarkerColor "ColorBlue";};}							 
		                      };
				   
				   
			//////////////////////////////////////////////	   
				   } forEach _zoneMarkersArray;
		       		
	   
	   
	} forEach _countZonesArray;
};






_id = _this select 0;
_zone = "FL_Zone" + str _id;
_score = _this select 1;

_owner = missionNamespace getVariable [_zone, ""];

("mt_zone" + str _id) setMarkerText (format ["zone%1 %2/100", _id, abs (_score)]);

switch (true) do {

      case (_score > 0): {
	                           if (_owner != "BLUFOR") then {
							                 //call function ownerUpdate!
											 _owner = "BLUFOR";
											 missionNamespace setVariable [_zone, _owner, true];
											 [_id, _owner] call _ownerUpdate;
							   };
	  };
	  
	  case (_score < 0): {
	                           if (_owner != "OPFOR") then {
							                 //call function ownerUpdate!
											 _owner = "OPFOR";
											 missionNamespace setVariable [_zone, _owner, true];
											 [_id, _owner] call _ownerUpdate;
							   };
	  };


};