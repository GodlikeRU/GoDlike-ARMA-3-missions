//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Task functions //
//////////////////////////////////////////
GODLIKE_setTaskCompletion =
{

     private _id = _this select 0;

   if(DEBUG_MODE == 1) then
     { hint 'DEBUG: setting ' + _id + " to SUCCEEDED";};

    [_id, 'Succeeded',true] call BIS_fnc_taskSetState;

};

GODLIKE_setTaskFailure =
{
  private _id = _this select 0;

if(DEBUG_MODE == 1) then
  { hint 'DEBUG: setting ' + _id + " to FAILED";};

 [_id, 'Failed',true] call BIS_fnc_taskSetState;

};

// First line cleared
GODLIKE_onFirstLineCleared =
{
  ["TSK_breakFirstLine"] call GODLIKE_setTaskCompletion;
};

GODLIKE_onSecondLineCleared =
{
  ["TSK_breakSecondLine"] call GODLIKE_setTaskCompletion;
};

GODLIKE_onTownCleared =
{
  ["TSK_captureTown"] call GODLIKE_setTaskCompletion;
};

GODLIKE_onCheckpointCleared =
{
  ["TSK_clearCheckpoint"] call GODLIKE_setTaskCompletion;
};

GODLIKE_onReinforcementsDead =
{
  ["TSK_ambushEnemyReinforcements"] call GODLIKE_setTaskCompletion;
};

GODLIKE_onArtilleryDead =
{
  ["TSK_disableArtillery"] call GODLIKE_setTaskCompletion;
};

// If player entered town and didn't kill arty - fire
GODLIKE_onTownEntered =
{
  if(!("TSK_disableArtillery" call bis_fnc_taskCompleted)) then
    {
      call GODLIKE_commanderSayTownEntered;
      call GODLIKE_fireEnemyArtillery;
    };
};



GODLIKE_endMissionVictory =
{
  ["EndVictory"] call BIS_fnc_endMission;
};


GODLIKE_onExtractionDone =
{
  ["TSK_extraction"] call GODLIKE_setTaskCompletion;
  call GODLIKE_endMissionVictory;
};
