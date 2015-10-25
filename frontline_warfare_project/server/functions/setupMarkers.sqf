
//Setting up vars for opfor markers
private ["_zoneMarkersArray", "_zoneSide", "_mark", "_anotherZone","_anotherZoneSide", "_zoneArray", "_zone", "_zoneColor", "_markScore"];
{
    missionNamespace setVariable [_x, "OPFOR", true];
} forEach
    [
	  "FL_Zone1",
	  "FL_Zone2",
	  "FL_Zone3",
	  "FL_Zone4",
	  "FL_Zone5",
	  "FL_Zone6",
	  "FL_Zone8",
	  "FL_Zone16",
	  "FL_Zone17",
	  "FL_Zone20",
	  "FL_OPBASE"
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
	  "FL_Zone13",
	  "FL_Zone14",
	  "FL_Zone15",
	  "FL_Zone18",
	  "FL_Zone19",
	  "FL_BLUBASE"
    ];

for "_i" from 1 to 20 do
{
   
   missionNamespace setVariable [format ["score_zone%1", _i], 100, true];
   missionNamespace setVariable [format ["isCapturing_zone%1", _i], false, true];
   missionNamespace setVariable [format ["winSide_zone%1", _i], "neutral", true];
   
};	

//Setting up initial marker colors for all zones
_zoneMarkersArray = "";
_markSide = "";

sleep 2;  
  for "_i" from 1 to 20 do {
  
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
		
		};
		
		
		{
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
		   
		} forEach _zoneMarkersArray;
  };
  
//Setting up initial zone's colors and text markers
_zoneArray = call allZoneMarkers;
_zoneSide = "";
_zone = "";


for "_i" from 1 to 20 do {
      
	_zoneSide = missionNamespace getVariable ["FL_Zone" + str _i,""];
	_zone = "zone" + str _i;
    
	if (_zoneSide == "OPFOR") then {_zoneColor = "ColorRed"};
    if (_zoneSide == "BLUFOR") then {_zoneColor = "ColorBlue";};
    if (_zoneSide == "") then {_zoneColor = "ColorWhite";};
    _zone setMarkerColor _zoneColor;	
	
	//Score Marker
	_markScore = createMarker ["mt_zone" + str _i,[((getMarkerPos _zone) select 0) + 100, ((getMarkerPos _zone) select 1) + 80, 0]];
	_markScore setMarkerColor _zoneColor;
	_markScore setMarkerShape "ICON";
	_markScore setMarkerType "mil_dot";
	_markScore setMarkerText (_zone + " 100/100");


}; 

	