//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Script init //
//////////////////////////////////////////

DEBUG_MODE = 0;

// Init variables for mission
execVM "varInit.sqf";

// GoDMode for test
//player allowDamage false;

// default map viewDistance
setViewDistance 2000;

// Load INIT
//execVM "bombInit.sqf";
execVM "bombInitServer.sqf"; // Will run only in-game
execVM "markerInit.sqf";
execVM "taskInit.sqf";


// Load functions
//execVM "posFunctions.sqf";
execVM "taskFunctions.sqf";
execVM "aiFunctions.sqf";
execVM "chatFunctions.sqf";
