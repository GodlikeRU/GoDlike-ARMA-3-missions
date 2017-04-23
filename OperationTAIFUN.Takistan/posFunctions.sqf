//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: positions functions //
//////////////////////////////////////////

randomizeWarlordPos = {
  _randomPos = ["marker_27", false] call CBA_fnc_randPosArea;

  _nearestBuilding = nearestBuilding _randomPos;
  _pos1 = _nearestBuilding buildingPos 1;
  _pos1
};



getRandomWarlordPos = {
  CORRECTPOS = false;
_pos1 = [0,0,0];

while {!CORRECTPOS} do
  {
    _pos1 = call randomizeWarlordPos;
    if(_pos1 distance [0,0,0] > 0) then {
      // Engine bug workaround
    CORRECTPOS = true;
    };

  };


_pos1

};
