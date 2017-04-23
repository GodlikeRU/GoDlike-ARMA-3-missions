//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Not used at time of writing
 //Reverses sequences for instructions text purposes //
//////////////////////////////////////////

//

// Workaround for lack of array copy with select
_originalSequences = +SEQUENCES;

_copied1Sequence = SEQUENCES select 0;
reverse _copied1Sequence;
_copied2Sequence = SEQUENCES select 1;
reverse _copied2Sequence;
_copied3Sequence = SEQUENCES select 2;
reverse _copied3Sequence;

// Someone may want to improve with for loop and pushBack but I don't need that ;)

_reversedSequences = [_copied1Sequence, _copied2Sequence, _copied3Sequence];

_reversedSequences
