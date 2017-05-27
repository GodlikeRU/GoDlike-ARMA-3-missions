//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: DEBUG functions //
//////////////////////////////////////////

// Kills all units in trigger area
DEBUG_killUnitsInTriggerArea =
{
  params ["_triggerName"];

  _trigger = triggerArea _triggerName;
  _triggerXPos = _trigger select 0;

  _unitsInArea = nearestObjects [getPos _triggerName, ["AllVehicles"], _triggerXPos];
  {
     _x setDamage 1;
  } forEach _unitsInArea;
};

// Kills all units in area
DEBUG_killUnitsInArea =
{
  params ["_pos", "_radius"];

  _unitsInArea = nearestObjects [_pos, ["AllVehicles"], _radius];
  {
     _x setDamage 1;
  } forEach _unitsInArea;

};

// Kills all units in marker area
DEBUG_killUnitsInMarkerArea =
{
  params ["_marker", "_radius"];

  _unitsInArea = nearestObjects [getMarkerPos _marker, ["AllVehicles"], _radius];
  {
     _x setDamage 1;
  } forEach _unitsInArea;
};

// Kills specified units
// Remember double bracket shit
DEBUG_killSpecifiedUnits =
{
  params ["_unitsList"];

  {
    _x setDamage 1;
  } forEach _unitsList;

};

DEBUG_FixRPG7Loadout =
{
  params ["_player"];
  _player removePrimaryWeaponItem "rhs_acc_pgo7v";
  _player addPrimaryWeaponItem "rhs_acc_pso1m2";
};
