//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Bomb init SERVER ONLY //
//////////////////////////////////////////
// * Feel free to modify and use this script in any other mission! *
//////////////////////////////////////////

if (!isServer) exitWith {};

  private _handle = [] spawn {
  sleep 15; // Sleep causes script to run after briefing only in-game (THANKS BI - no sarcasm)
// Server only code
SEQUENCES = [call COB_fnc_generateUniqueSequence,call COB_fnc_generateUniqueSequence,call COB_fnc_generateUniqueSequence];
SEQUENCE_CORRECT_INDEX = (round(random 2));
CODE = [(round(random 9)), (round(random 9)), (round(random 9)), (round(random 9)), (round(random 9)), (round(random 9))];

// Send combintions to clients
//publicVariable "SEQUENCES";
//publicVariable "SEQUENCE_CORRECT_INDEX";
//publicVariable "CODE"; Instable

[SEQUENCES, CODE, SEQUENCE_CORRECT_INDEX] remoteExec ["COB_fnc_bombInit", 0]; // stable
execVM "DEFUSE\tickInit.sqf";
execVM "DEFUSE\timerCountdown.sqf";

documentsCode setVariable ["RscAttributeDiaryRecord_texture","a3\structures_f_epc\Items\Documents\Data\document_secret_01_co.paa", true];
[documentsCode,"RscAttributeDiaryRecord",["Bomb code",str (CODE select 0) +"-"+ str (CODE select 1) +"-"+ str (CODE select 2)+"-"+ str (CODE select 3) +"-"+ str (CODE select 4) +"-"+ str (CODE select 5),""]] call bis_fnc_setServerVariable;
documentsCode setVariable ["recipients", EAST, true];

};
