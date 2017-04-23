//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Bomb timer logic //
//////////////////////////////////////////

if(!isServer) exitWith{};

GODLIKE_bombStartTimer =
{
  private _handle = [] spawn
  {

    for "_i" from 1 to 600 do
    {
      if(!DEFUSED) then
      {
        if(_i == 180) then {_i remoteExec ["GODLIKE_commanderSayTimer",0];};
        if(_i == 300) then {_i remoteExec ["GODLIKE_commanderSayTimer",0];};
        if(_i == 480) then {_i remoteExec ["GODLIKE_commanderSayTimer",0];};
        if(_i == 540) then {_i remoteExec ["GODLIKE_commanderSayTimer",0];};
        if(_i == 590) then {_i remoteExec ["GODLIKE_commanderSayTimer",0];};
        if(_i == 599) then {call COB_fnc_boom;};
        uiSleep 1;
      };
    };

  };
};
