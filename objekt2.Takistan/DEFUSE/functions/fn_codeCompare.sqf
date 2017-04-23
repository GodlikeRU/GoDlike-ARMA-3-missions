// Modified by GODLIKE

//Parameters
private ["_code", "_inputCode"];
_code      = [_this, 0, [], [[]]] call BIS_fnc_param;
_inputCode = [_this, 1, [], [[]]] call BIS_fnc_param;


//compare codes
private "_compare";
_compare = [_code, _inputCode] call BIS_fnc_areEqual;

// If isnt already defused
if (!DEFUSED) then
{

	// If code input is disabled
	if(BOMB_CODE_DISABLED) then
		{
			cutText ["CODE INPUT IS DISABLED", "PLAIN DOWN"];
		}
	else
		{

		if (_compare) then {
			call COB_fnc_defused; // Sadly code was correct :(
		} else {
			call COB_fnc_boom; // I love this  :D
		};

	};

	CODEINPUT = [];
}
else
{
  cutText ["Bomb is already defused...", "PLAIN DOWN"];
};
//Return Value
_code
