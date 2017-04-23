//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: AI functions //
//////////////////////////////////////////

GODLIKE_SpawnGuardingGroup =
{
  params
  [
    ["_center",objNull,["",objNull,[]],[3]],
    ["_grpParam",EAST,[WEST]],
    ["_manType",["O_Soldier_F","O_Soldier_AR_F"],[[]]],
    ["_limit", 5],
    ["_shuffle", true]
  ];
  private ["_cntManType"];

  _cntManType = (count _manType);

  _randomTypes = [];


  for "_i" from 0 to (_limit) step 1 do
  {
    _rndMan = (_manType select floor(random(_cntManType)));
    _randomTypes pushBack _rndMan;
  };

  if(!_shuffle) then
    {
      _randomTypes = [];
      _randomTypes = _manType;
    };

  _group = [getMarkerPos _center, EAST, _randomTypes] call BIS_fnc_spawnGroup;
  [_group, getPos leader _group, 150, 2, true] call CBA_fnc_taskDefend;

};

// Bomber arrived to checkpoint
GODLIKE_onBomberArrived =
{
  if (!isServer) exitWith {};


    // Go to heli
    bomberOfficer assignAsCargo bomberEscapeHelicopter;
    bomberPilot assignAsDriver bomberEscapeHelicopter;
    doGetOut bomberOfficer;
    doGetOut bomberPilot;
    [bomberOfficer,bomberPilot] orderGetIn true;

    // Wait until they're both in heli
    waitUntil {bomberOfficer in bomberEscapeHelicopter && bomberPilot in bomberEscapeHelicopter};
    bomberEscapeHelicopter engineon true; //[4114.56,2888.41,20]

    // Escape
    bomberPilot doMove [4454.5,174.901,100];

};



// Spawn units in base in case player got there. They shouldn't but I spawn them dynamically to save precious cpu resources
GODLIKE_onNorthBaseTriggered =
{
    // NorthBase
    //_units = ["marker_gar_01",EAST,300,0.4,["CUP_O_TK_INS_SOLDIER","CUP_O_TK_INS_SOLDIER_FNFAL", "CUP_O_TK_INS_SOLDIER_ENFIELD", "CUP_O_TK_INS_SOLDIER_AT", "CUP_O_TK_INS_SOLDIER_TL", "CUP_O_TK_INS_SOLDIER_AR"],12, true] spawn SBGF_fnc_garrison;

    ["marker_gar_01",EAST,["CUP_O_TK_INS_SOLDIER","CUP_O_TK_INS_SOLDIER_FNFAL", "CUP_O_TK_INS_SOLDIER_ENFIELD", "CUP_O_TK_INS_SOLDIER_AT", "CUP_O_TK_INS_SOLDIER_TL", "CUP_O_TK_INS_SOLDIER_AR"],12] spawn GODLIKE_SpawnGuardingGroup;

};


// Spawn units in base in case player got there. They shouldn't but I spawn them dynamically to save precious cpu resources DISABLED
GODLIKE_onSouthBaseTriggered =
{

     ["marker_gar_02",
     EAST,
     ["CUP_O_TK_INS_SOLDIER","CUP_O_TK_INS_SOLDIER_FNFAL", "CUP_O_TK_INS_SOLDIER_ENFIELD", "CUP_O_TK_INS_SOLDIER_AT", "CUP_O_TK_INS_SOLDIER_TL", "CUP_O_TK_INS_SOLDIER_AR"],
     20] spawn GODLIKE_SpawnGuardingGroup;


};

// Players detected by enemy in town
GODLIKE_onBombTownFired =
{
  if (!isServer) exitWith {};
  if(!DETECTED) then
    {
      DETECTED = true;
      call GODLIKE_onBombTownDetected;
    };
};

// Players detected by enemy in town
GODLIKE_onBombTownDetected =
{
  if (!isServer) exitWith {};
  call GODLIKE_bombStartTimer; // Start bomb countdown
  remoteExec ["GODLIKE_commanderSayDetected", 0];
};
