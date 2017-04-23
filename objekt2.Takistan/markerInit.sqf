//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Dynamic Marker INIT //
//////////////////////////////////////////

_handle = [] spawn
{
  _marker = createMarker ["Bomber Vehicle", position bomberVehicle];
  _marker setMarkerShape "ICON";
  _marker setMarkerType "o_motor_inf";
  _marker setMarkerColor "ColorRed";

  while {alive bomberOfficer} do
    {
      sleep 1;
      _marker setMarkerPos position bomberVehicle;

    };
};
