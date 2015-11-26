
private ["_zone", "_marker", "_score", "_zoneName", "_nameArray"];
_zone = _this select 0;
_score = _this select 1;
_marker = "mt_zone" + str _zone;

_nameArray = call nameZoneArray;

{
	if ((_x select 0) == _zone) then
		{
			_zoneName = _x select 1;
		};	
} forEach _nameArray;

("mt_zone" + str _zone) setMarkerText (format ["%1 %2/100", _zoneName, abs (_score)]);