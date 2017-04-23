//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE:Generates unique sequence for bomb defusal //
//////////////////////////////////////////
private "_sequence";
_sequence = [];

for "_i" from 0 to 8 do
  {
    _newSequence = nil;
    _newSequence = selectRandom SEQUENCE_TYPES;

    // If not unique
    if(_newSequence in _sequence) then
      {
        // Run until unique
        while {_newSequence in _sequence} do
          {
            _newSequence = selectRandom SEQUENCE_TYPES;
          };
      };

      _sequence pushBack _newSequence;
  };

_sequence
