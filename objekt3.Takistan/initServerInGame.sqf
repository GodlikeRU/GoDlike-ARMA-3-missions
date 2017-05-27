//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Server only code after game start //
//////////////////////////////////////////

// Better safe than sorry lol
if (!isServer) exitWith {};

// Sleep makes it run after game start
private _handle = [] spawn
{
  sleep 15;
  execVM "bombBase.sqf";
  call GODLIKE_commanderSayGL;

};
