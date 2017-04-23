//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Called when bomb is defused //
//////////////////////////////////////////

cutText ["BOMB DEFUSED", "PLAIN"];
DEFUSED = true;
playSound "button_close";
closeDialog 1;

// Transmit data to all entities
publicVariable "DEFUSED";
