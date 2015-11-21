
#define adminMenu_option 50001
disableSerialization;

_displayAdmin = uiNamespace getVariable ["AdminMenu", displayNull];
 if (!isNull _displayAdmin) then {
	_adminSelect = _displayAdmin displayCtrl adminMenu_option;
	
	switch (lbCurSel _adminSelect) do {
	
		case 0: {
					closeDialog 0;
					["FL_teleport", "onMapSingleClick",
					{
						vehicle player setPos _pos;
						["FL_teleport", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
						
						true
					}
					] call BIS_fnc_addStackedEventHandler;	
					hint "Click on map to teleport!";
				};
	};				
 };