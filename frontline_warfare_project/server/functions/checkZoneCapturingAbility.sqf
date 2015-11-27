//isAbleCap_zone%1

private ["_zoneMarkersArray", "_zoneOwner", "_currentZoneOwner", "_countEnemeyZone"];

for "_i" from 1 to 22 do
{
	_zoneOwner = missionNamespace getVariable (format ["FL_Zone%1", _i]);
	switch (_i) do 
	{
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
		case 21: {_zoneMarkersArray = call zone21;};
		case 22: {_zoneMarkersArray = call zone22;};
	};
	_countEnemyZone = 0;
	{
		if (typeName (_x select 1) == "SCALAR") then
		{
			_currentZoneOwner = missionNamespace getVariable ("FL_Zone" + str (_x select 1));
			if (_currentZoneOwner != _zoneOwner) then
			{
				_countEnemyZone = _countEnemyZone + 1;
			};
		};		
		
	} forEach _zoneMarkersArray;
	
	if (_countEnemyZone > 0) then
	{
		missionNamespace setVariable [format ["isAbleCap_zone%1", _i], true, true];
	}
	else
	{
		missionNamespace setVariable [format ["isAbleCap_zone%1", _i], false, true];
	};	
};