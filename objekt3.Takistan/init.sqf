//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Script init //
//////////////////////////////////////////

DEBUG_MODE = 0;
enableSaving [false, false];

// Init variables for mission
execVM "varInit.sqf";


// GoDMode for test
//player allowDamage false;

// default map viewDistance
setViewDistance 2000;

// Load INIT
execVM "taskInit.sqf";


// Load functions
execVM "debugFunctions.sqf";
//execVM "posFunctions.sqf";
execVM "taskFunctions.sqf";
execVM "aiFunctions.sqf";
execVM "chatFunctions.sqf";
