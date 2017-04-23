//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Script init //
//////////////////////////////////////////

DEBUG_MODE = 0;
EXTRACTION_ALLOWED = false;
BASE_FIRE_TRIGGERED = false;
BASEVEHICLEBASE_FIRE_TRIGGERED = false;

// default map viewDistance
setViewDistance 2000;

// Revive script (Thanks Farooq!)
//call compileFinal preprocessFileLineNumbers "FAR_revive\FAR_revive_init.sqf";

// Create tasks and set task trigger
execVM "taskInit.sqf";

// Load functions
execVM "posFunctions.sqf";
execVM "taskFunctions.sqf";
execVM "aiFunctions.sqf";

// Play isis music
sleep 1;
execVM "musicLoop.sqf";


if(isServer) then
{
  // Spawn garrissoned units at town
  sleep 5;
  // leaderBase
  _units = ["marker_garunits",EAST,300,0.4,["CUP_O_TK_INS_SOLDIER","CUP_O_TK_INS_SOLDIER_FNFAL", "CUP_O_TK_INS_SOLDIER_ENFIELD", "CUP_O_TK_INS_SOLDIER_AT", "CUP_O_TK_INS_SOLDIER_TL", "CUP_O_TK_INS_SOLDIER_AR"],12] spawn SBGF_fnc_garrison;
  // FuelStation
  _units2 = ["marker_garunits2",EAST,250,0.4,["CUP_O_TK_INS_SOLDIER","CUP_O_TK_INS_SOLDIER_FNFAL", "CUP_O_TK_INS_SOLDIER_ENFIELD", "CUP_O_TK_INS_SOLDIER_AT", "CUP_O_TK_INS_SOLDIER_TL", "CUP_O_TK_INS_SOLDIER_AR"],12] spawn SBGF_fnc_garrison;
  //North of LeaderBase
  _units3 = ["marker_garunits3",EAST,200,0.4,["CUP_O_TK_INS_SOLDIER","CUP_O_TK_INS_SOLDIER_FNFAL", "CUP_O_TK_INS_SOLDIER_ENFIELD", "CUP_O_TK_INS_SOLDIER_AT", "CUP_O_TK_INS_SOLDIER_TL", "CUP_O_TK_INS_SOLDIER_AR"],12] spawn SBGF_fnc_garrison;


  // Set leader at random position
  sleep 5;
  _randPos = call getRandomWarlordPos;
  targetWarlord setPos _randPos;
  targetWarlord disableAI "move";
};
