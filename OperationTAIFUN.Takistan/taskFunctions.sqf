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



GODLIKE_endMissionVictory =
{
  ["EndVictory"] call BIS_fnc_endMission;
};


GODLIKE_onDocumentsGrab =
{
  ["TSK_getDocuments"] call GODLIKE_setTaskCompletion;
  if (!isServer) exitWith {};
  deleteVehicle intelDocuments;
};

GODLIKE_onRadioDestroy =
{
  ["TSK_destroyRadio"] call GODLIKE_setTaskCompletion;
};

GODLIKE_onLeaderKill =
{
  ["TSK_killLeader"] call GODLIKE_setTaskCompletion;
};

GODLIKE_baseFuelStationCisternsDestroyed =
{
  ["TSK_blowUpFuelStation"] call GODLIKE_setTaskCompletion;
  if (!isServer) exitWith {};
  "Armored group is heading to the fuel station!" remoteExec ["hint"];
  _distractedGroup = [baseLeaderBase_distractionVehicleT55, baseLeaderBase_distractionVehicleT55_1, baseLeaderBase_distractionVehicleBRDM, baseLeaderBase_distractionVehicleBMP2];
  _wp1Pos = [12229.6,10698,0];
  _wp2Pos = [11625.8,10936.6,0];
  _wp3Pos = getMarkerPos "marker_15";
  { _grp = group _x;
   _grp setSpeedMode "FULL";
   _grp setBehaviour "COMBAT";
    _wp1 = _grp addWaypoint  [_wp1Pos, 0];
    _wp1 setWaypointType "MOVE";
    _wp2 = _grp addWaypoint [_wp2Pos, 1];
    _wp2 setWaypointType "MOVE";
    _wp3 = _grp addWaypoint  [_wp3Pos, 2];
    _wp3 setWaypointType "MOVE";
   } forEach _distractedGroup;
//  _distractedGroup setSpeedMode "FULL";
//_distractedGroup setBehaviour "COMBAT";
//  _distractedGroup selectLeader baseLeaderBase_distractionVehicleT55;


};

GODLIKE_onExtractionDone =
{
  ["TSK_extraction"] call GODLIKE_setTaskCompletion;
  call GODLIKE_endMissionVictory;
};
