//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Executed ON SERVER when player joins mission //
//////////////////////////////////////////

_this select 0 addEventHandler ["HandleRating",{1}]; // Disable rating

// Override score handling TURNED OFF
/*_this select 0 addEventHandler ["HandleScore",
{
  _object = _this select 1;
  _score = _this select 2
  if(_score < 0) then
    {
      if(typeOf _object == Vehicle) then
        {
          hint "vehicle";
        };
    };
}];
*/
