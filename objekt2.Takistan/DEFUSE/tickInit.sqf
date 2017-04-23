//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Bomb ticking script //
//////////////////////////////////////////

if(!isServer) exitWith{};

private _handle = [] spawn {
  while {!DEFUSED} do
  {
    [bomb, "bomb_tick"] call CBA_fnc_globalSay3d;
    uiSleep 1.5;
  };
};
