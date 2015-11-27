
//Setting up vars for opfor markers
private ["_zoneMarkersArray", "_zoneSide", "_mark", "_anotherZone","_anotherZoneSide", "_zoneArray", "_zone", "_zoneColor", "_markScore", "_zoneName", "_zoneNameArray"];
{
    missionNamespace setVariable [_x, "OPFOR", true];
} forEach
    [
	  "FL_Zone1",
	  "FL_Zone2",
	  "FL_Zone3",
	  "FL_Zone4",
	  "FL_Zone5",
	  "FL_Zone6",     //zone's owner vars
	  "FL_Zone8",
	  "FL_Zone16",
	  "FL_Zone17",
	  "FL_Zone20",
	  "FL_Zone21" //opfor base
    ];

//Setting up vars for blufor markers	
{
    missionNamespace setVariable [_x, "BLUFOR", true];
} forEach
    [
	  "FL_Zone7",
	  "FL_Zone9",
	  "FL_Zone10",
	  "FL_Zone11",
	  "FL_Zone12",
	  "FL_Zone13",   //zone's owner vars
	  "FL_Zone14",
	  "FL_Zone15",
	  "FL_Zone18",
	  "FL_Zone19",
	  "FL_Zone22"  //blufor base
    ];

for "_i" from 1 to 22 do
{
   
   missionNamespace setVariable [format ["score_zone%1", _i], 100, true];
   missionNamespace setVariable [format ["isCapturing_zone%1", _i], false, true];
   missionNamespace setVariable [format ["winSide_zone%1", _i], "neutral", true];
   
};	

{
   missionNamespace setVariable [_x, -100, true]; //opfor
} forEach ["score_zone1", "score_zone2", "score_zone3", "score_zone4", "score_zone5", "score_zone6", "score_zone8", "score_zone16", "score_zone17", "score_zone20","score_zone21"];

{
   missionNamespace setVariable [_x, 100, true]; //blufor
} forEach ["score_zone7", "score_zone9", "score_zone10", "score_zone11", "score_zone12", "score_zone13", "score_zone14", "score_zone15", "score_zone18", "score_zone19","score_zone22"];

for "_i" from 1 to 22 do
{
	missionNamespace setVariable [format ["isAbleCap_zone%1", _i], false, true];
};	

//Setting up initial marker colors for all zones
_zoneMarkersArray = "";
_markSide = "";

sleep 2;  
  for "_i" from 1 to 22 do {
  
        _zoneSide = missionNamespace getVariable ["FL_Zone" + str _i, "any"];
		switch (_i) do {
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
				  case 21: {_zoneMarkersArray = call zone21;}; //opbase
				  case 22: {_zoneMarkersArray = call zone22;}; //blubase
		
		};
		
		
		{
		   _mark = _x select 0;
		   _anotherZone = _x select 1;
		   
		   switch (_anotherZone) do {
		           
				   case "any": {_anotherZoneSide = "any";};
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
		   
		} forEach _zoneMarkersArray;
  };
  
//Setting up initial zone's colors and text markers
_zoneArray = call allZoneMarkers;
_zoneSide = "";
_zone = "";
_zoneName = "";
_zoneNameArray = call nameZoneArray;

for "_i" from 1 to 22 do {
      
	_zoneSide = missionNamespace getVariable ["FL_Zone" + str _i,""];
	_zone = "zone" + str _i;
    
	if (_zoneSide == "OPFOR") then {_zoneColor = "ColorRed"};
    if (_zoneSide == "BLUFOR") then {_zoneColor = "ColorBlue";};
    if (_zoneSide == "") then {_zoneColor = "ColorWhite";};
    _zone setMarkerColor _zoneColor;

	{
		if (_i == (_x select 0)) then
			{
				_zoneName = _x select 1;
			};	
	} forEach _zoneNameArray;
	
	//Score Marker
	_markScore = createMarker ["mt_zone" + str _i,[((getMarkerPos _zone) select 0) + 100, ((getMarkerPos _zone) select 1) + 80, 0]];
	_markScore setMarkerColor _zoneColor;
	_markScore setMarkerShape "ICON";
	_markScore setMarkerType "mil_dot";
	_markScore setMarkerText (_zoneName + " 100/100");


};

[] call fn_checkZoneCapturingAbility;