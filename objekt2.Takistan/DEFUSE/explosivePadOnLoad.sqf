//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Hack for displaying variables in dialogs //
//////////////////////////////////////////

ExplosivePadOnLoad = {
  _text = BOMB_TYPES select SEQUENCE_CORRECT_INDEX;
  ((_this select 0) displayCtrl 1100) ctrlSetText _text;
};
