//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Returns friendly name for current sequence item //
//////////////////////////////////////////
params ["_sequenceItemName"];

private ["_FOUND", "_friendlyName"];
_FOUND = false;
_friendlyName = nil;

// Find index in not friendly sequence types
for "_i" from 0 to 8 do
  {
    if(_sequenceItemName == (SEQUENCE_TYPES select _i)) then
      {
        // Select friendly name from other array using same index
        _FOUND = true;
        _friendlyName = SEQUENCE_FRIENDLY_NAMES select _i;

      };
  };

// return friendly name
_friendlyName
