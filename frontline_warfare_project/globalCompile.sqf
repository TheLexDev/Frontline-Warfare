
private ["_DEBUG"];
_DEBUG = format ["%1", _this select 0];

mf_compile = compileFinal
('
	private ["_path", "_isDebug", "_code"];
	_path = "";
	_isDebug = ' + _DEBUG + ';

	switch (toUpper typeName _this) do {
		case "STRING": {
			_path = _this;
		};
		case "ARRAY": {
			_path = format["%1\%2", _this select 0, _this select 1];
		};
		case "CODE": {
			_code = toArray str _this;
			_code set [0, (toArray " ") select 0];
			_code set [count _code - 1, (toArray " ") select 0];
		};
	};

	if (isNil "_code") then {
		if (_isDebug) then {
			compile format ["call compile preProcessFileLineNumbers ""%1""", _path]
		} else {
			compileFinal preProcessFileLineNumbers _path
		};
	} else {
		if (_isDebug) then {
			compile toString _code
		} else {
			compileFinal toString _code
		};
	};
');

_serverFunc = "server\functions";
_clientFunc = "client\functions";
//functions

fn_zoneUpdate = [_serverFunc, "zoneUpdate.sqf"] call mf_compile;
fn_updateTextMarker = [_serverFunc, "updateTextMarker.sqf"] call mf_compile;
fn_checkZoneCapturingAbility = [_serverFunc, "checkZoneCapturingAbility.sqf"] call mf_compile;



///////Capture Process

captureProcess = {

       _zone = _this select 0;
       _id = _this select 1;
       _isCapturing = missionNamespace getVariable [format ["isCapturing_zone%1", _id], false];
//// start loop

while {_isCapturing} do {
               
			   _winSide = missionNamespace getVariable [format ["winSide_zone%1", _id], "neutral"];
			   _score = missionNamespace getVariable [format ["score_zone%1", _id], 0];
			   switch (_winSide) do 
			   {
			        case "blufor": {
					                    if (_score < 100) then {
										     if ((_score + 1) == 0) then {
											      _score = _score + 2;
											 } else {
       											 _score = _score + 1;
												 };
												  missionNamespace setVariable [format ["score_zone%1", _id], _score, true];
												  [_id, _score] call fn_zoneUpdate;
												  
										};
								   };
			        case "opfor":  {
					                    if (_score > -100) then {
										        if ((_score - 1) == 0) then {  
												  _score = _score - 2;
												  } else {
												      _score = _score - 1;
												  };
												  missionNamespace setVariable [format ["score_zone%1", _id], _score, true];
												  [_id, _score] call fn_zoneUpdate;
										};
								   };
					case "neutral": {missionNamespace setVariable [format ["isCapturing_zone%1", _id], false, true]};			   
			   };
			   
	
	
	//sleep capturing interval
	
	sleep 1;
    _isCapturing = missionNamespace getVariable [format ["isCapturing_zone%1", _id], false];	
};   

}
call mf_compile;