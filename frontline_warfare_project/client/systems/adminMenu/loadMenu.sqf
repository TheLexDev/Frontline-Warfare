
#define adminMenu_option 50001
disableSerialization;

private ["_start", "_displayAdmin", "_adminSelect"];

_start = createDialog "AdminMenu";
_displayAdmin = uiNamespace getVariable "AdminMenu";
_adminSelect = _displayAdmin displayCtrl adminMenu_option;

_adminSelect lbAdd "Teleport";

