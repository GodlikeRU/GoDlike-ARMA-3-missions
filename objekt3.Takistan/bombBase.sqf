//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Bomb ISIS base //
//////////////////////////////////////////

if (!isServer) exitWith {};

_ambientBomberFlyStartPos = [1445.33,4871.51,0];
_ambientBomberFlyEndPos = [8520.18,7466.97,0];
[_ambientBomberFlyStartPos,_ambientBomberFlyEndPos,600,"FULL","RHS_TU95MS_vvs_dubna",EAST] call BIS_fnc_ambientFlyby;

_bombPositions = [];
_bombPositions pushBack "marker_97";
_bombPositions pushBack "marker_98";
_bombPositions pushBack "marker_99";
_bombPositions pushBack "marker_100";
_bombPositions pushBack "marker_101";
_bombPositions pushBack "marker_102";
_bombPositions pushBack "marker_103";
_bombPositions pushBack "marker_104";
_bombPositions pushBack "marker_105";
_bombPositions pushBack "marker_106";
_bombPositions pushBack "marker_107";
_bombPositions pushBack "marker_108";
_bombPositions pushBack "marker_109";
_bombPositions pushBack "marker_110";


{
  _currentBombPos = _x;
  _bomb = 'BO_GBU12_LGB' createvehicle [(getMarkerPos _currentBombPos select 0),(getMarkerPos _currentBombPos select 1),(getMarkerPos _currentBombPos select 2) + 5000];
  _bomb setVectorUp [0,0.99,0.01];
  sleep 0.5
}
forEach _bombPositions;
