//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: BOOM BABY on Server YEAH //
//////////////////////////////////////////
if (!isServer) exitWith {};

BOOM = true;
publicVariable "BOOM"; // transmit boom to all clients

_veh = "Bo_GBU12_LGB" createVehicle position bomb; // Create a bomb m8


{

  _x setDamage 1; // Kill all players
} forEach allPlayers;
