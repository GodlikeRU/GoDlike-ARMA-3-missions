//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: BOOM BABY if you try to get away from bomb while disarming //
//////////////////////////////////////////


// Workaround for bugged onUnload
ExplosivePadOnKeyDown =
{
  // If escape key is pressed  == trying to exit bomb defusal
  _DikCode  =                   _this select 1;

  // If bomb isn't already defused then boom :D
  if(!DEFUSED && _DikCode == 0x01) then
  {
    call COB_fnc_boom;
  };
};
