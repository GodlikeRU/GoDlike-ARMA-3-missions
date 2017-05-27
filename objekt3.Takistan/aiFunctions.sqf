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
GODLIKE_onReinforcementsUnloadDone =
{
  if (!isServer) exitWith {};

  // Make infantry attack positions after unload
  [infantry_AttackInfantry01, getMarkerPos "marker_66", 100] call CBA_fnc_taskAttack;
  [infantry_AttackInfantry02, getMarkerPos "marker_66", 100] call CBA_fnc_taskAttack;

  // Make enemy reinforcements go
  TANKS_HEADING = true;

};

// Artillery fire
GODLIKE_fireEnemyArtillery =
{
  // Get ammo type
  _arties = [vehicle_NorthBaseKatiusza01, vehicle_NorthBaseKatiusza02, vehicle_NorthBaseKatiusza03];
  _ammoDirty = getArtilleryAmmo [vehicle_NorthBaseKatiusza01];
  _ammo = _ammoDirty select 0;

  _target = nil;

  // Select target
  _isInRange01 = getPos vehicle_PlayersTank inRangeOfArtillery [[vehicle_NorthBaseKatiusza01], str _ammo];
  _isInRange02 = getPos vehicle_AttackVehicleT801 inRangeOfArtillery [[vehicle_NorthBaseKatiusza01], str _ammo];
  _isInRange03 = [2629.06,5095.01,0] inRangeOfArtillery [[vehicle_NorthBaseKatiusza01], str _ammo];

  // Targets priority
  if(_isInRange01 && alive vehicle_PlayersTank) then {_target = getPos vehicle_PlayersTank;} // Kill players tank
  else
  {
    if(_isInRange02 && alive vehicle_AttackVehicleT801) then {_target = getPos  vehicle_AttackVehicleT801;} // Kill AI tank
    else
      {
        _target = [2629.06,5095.01,0]; // Shoot at base
      };
  };

  {
    _x commandArtilleryFire [_target, _ammo, 40];
  } forEach _arties;

};

// Trigger by Killed EH on artillery crew
GODLIKE_onArtilleryCrewKilled =
{
  // Decrease living amount
  ARTY_CREW_COUNT = ARTY_CREW_COUNT -1;

  // If all dead then mark it
  if(ARTY_CREW_COUNT <= 0) then
  {
    ARTILLERY_CREW_KILLED = true;
  };
};
