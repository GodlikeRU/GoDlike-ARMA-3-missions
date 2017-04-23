//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: AI functions //
//////////////////////////////////////////

// Triggered when radiooperator heard gunfire
GODLIKE_baseShotsTriggered =
{
  if (!isServer) exitWith {};
  if(!BASE_FIRE_TRIGGERED) then
  {
    BASE_FIRE_TRIGGERED = true;

    // Make UAZ crew mount their vehicles
    baseVehicleGunner assignAsGunner baseVehicle;
    baseVehicleDriver assignAsDriver baseVehicle;
    [baseVehicleDriver,baseVehicleGunner] orderGetIn true;
    [group baseVehicleGunner, getPos baseLogic] call BIS_fnc_taskDefend;

    if(alive baseRadiooperator) then
    {
      // Make radiooperator run for radio
      _moveToPos = getPos radarTarget;
      baseRadiooperator setBehaviour "COMBAT";
      baseRadiooperator setSpeedMode "FULL";
      baseRadiooperator moveTo _moveToPos;
      "Radiooperator is running to call for reinforcements!" remoteExec ["hint"];
    };
  };
};

// Triggered when radiooperator got to the radio station
GODLIKE_baseRadiooperatorGotToRadio =
{
  if (!isServer) exitWith {};
  doStop baseRadiooperator;
  baseRadiooperator lookAt targetRadar;
  [baseRadiooperator, "REPAIR_VEH_KNEEL", "ASIS"] call BIS_fnc_ambientAnim;

  // Use spawn to allow sleep command
  _handle = [] spawn {
    sleep 5;
    if(alive baseRadiooperator) then
      {
        "Radiooperator managed to call reinforcements!" remoteExec ["hint"];
        baseRadiooperator call BIS_fnc_ambientAnim__terminate;
        call GODLIKE_baseBackupCalled;
        [group baseRadiooperator, getPos baseRadiooperator] call BIS_fnc_taskDefend;
      };
    };


};

// Ran when radiooperator succesfully called reinforcements
GODLIKE_baseBackupCalled =
{
  if (!isServer) exitWith {};
  [group backupBRDM, getPos baseLogic, 200] call CBA_fnc_taskAttack;
  [group backupT34, getPos baseLogic, 200] call CBA_fnc_taskAttack;
};

GODLIKE_baseVehicleBaseShotsTriggered =
{
  if (!isServer) exitWith {};
  if(!BASEVEHICLEBASE_FIRE_TRIGGERED) then
    {
      BASEVEHICLEBASE_FIRE_TRIGGERED = true;
      call GODLIKE_baseVehicleBase_UnblockAI;
    };
};

GODLIKE_baseVehicleBaseCrewKilled =
{
  if (!isServer) exitWith {};
  if(!BASEVEHICLEBASE_FIRE_TRIGGERED) then
    {
      BASEVEHICLEBASE_FIRE_TRIGGERED = true;
      call GODLIKE_baseVehicleBase_UnblockAI;
    };
};

GODLIKE_baseVehicleBase_UnblockAI =
{
  if (!isServer) exitWith {};
  { _x enableAI "MOVE"; } forEach units group  baseVehicleBaseCrew;
};

//
