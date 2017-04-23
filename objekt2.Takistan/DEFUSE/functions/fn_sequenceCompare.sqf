//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Handles bomb sequence clicks //
//////////////////////////////////////////

//Parameters
private ["_buttonName", "_correctSequence"];
_buttonName      = [_this,0,"",[""]] call BIS_fnc_param;

// If isnt already defused
if (!DEFUSED) then
{

  // If pressed button is correct in defuse sequence
  if (_buttonName == ((SEQUENCES select SEQUENCE_CORRECT_INDEX) select SEQUENCECURPOS)) then
  {
    hint str(SEQUENCECURPOS);
  }
  else // Boom
  { call COB_fnc_boom;};

  // If not already exploded
  if(!BOOM) then
  {
    // Advance to next button in sequence
    if (SEQUENCECURPOS < 7) then
      {SEQUENCECURPOS = SEQUENCECURPOS + 1}
    else // Bomb defused
      {
        call COB_fnc_defused;
      }
  };
}
else
{
  cutText ["Bomb is already defused...", "PLAIN DOWN"];
};
