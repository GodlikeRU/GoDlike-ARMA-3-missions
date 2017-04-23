//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Hack for displaying variables in dialogs //
//////////////////////////////////////////

InstructionsOnLoad = {
  _text = INSTRUCTIONS_CONTENTS select INSTRUCTIONS_CURRENT_INDEX;
  ((_this select 0) displayCtrl 1200) ctrlSetStructuredText  parseText _text;
};
