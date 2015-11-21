
private ["_key", "_handled"];

_key = _this select 1;
_handled = false;

//keys

switch (true) do {

  case (_key == 22):
              {
			       execVM "client\systems\adminMenu\adminMenu.sqf";
			  };
};

_handled
