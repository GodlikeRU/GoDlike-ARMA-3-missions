params
[
  ["_center",objNull,["",objNull,[]],[3]],
  ["_grpParam",EAST,[WEST]],
  ["_manType",["O_Soldier_F","O_Soldier_AR_F"],[[]]],
  ["_limit", 5]
];
private ["_cntManType"];

_cntManType = (count _manType);

_randomTypes = [];

for "_i" from 0 to (_limit) step 1 do
{
  _rndMan = (_manType select floor(random(_cntManType)));
  _randomTypes pushBack _rndMan;
};

hint str _randomTypes;
