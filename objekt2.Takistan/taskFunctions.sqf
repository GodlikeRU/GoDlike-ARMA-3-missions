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

GODLIKE_onRestrictedAreaEnter =
{
  if (!DEFUSED) then
  {
    ["EndFailBombExploded"] remoteExec ["BIS_fnc_endMission", 0]; // All units
  };
};

// If bomber escaped
GODLIKE_onBomberEscaped =
{
  ["EndFailBomberEscaped"] remoteExec ["BIS_fnc_endMission", 0]; // All units
};

// If bomber DIED
GODLIKE_onBomberDead =
{
  ["TSK_killBomber"] call GODLIKE_setTaskCompletion;
};

// Code read
GODLIKE_onCodeRead =
{
  ["TSK_findCode"] call GODLIKE_setTaskCompletion;
};

GODLIKE_onBombDefused =
{
  ["TSK_defuseBomb"] call GODLIKE_setTaskCompletion;
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
