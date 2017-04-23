//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Chat functions //
//////////////////////////////////////////


GODLIKE_commanderSayDetected =
{
  // enable sleep
  private _handle = [] spawn
  {
    BOMB_CODE_DISABLED = true;
    radioCommander sideChat "GHOST, you got detected by enemy!";
    sleep 7;
    radioCommander sideChat "They armed the bomb. Disarm code is now useless. You need to disarm the bomb manually. You have about 10 minutes before it explodes.";
    sleep 10;
    radioCommander sideChat "There should be some documents about arming it in the location where bomb is. Try to disarm the bomb using them.";
    sleep 10;
    radioCommander sideChat "Remember to NOT stop defusing it if you started. Our contact said the bomb will explode if you try to defuse it and walk away. Make sure that another soldier will read instructions!";
    sleep 5;
    radioCommander sideChat "Good luck GHOST!";
  };
};

GODLIKE_commanderSayTimer =
{
  params ["_seconds"];

  switch (_seconds) do
  {
    case 180: { radioCommander sideChat "BOMB will explode in about 7 minutes!";};
    case 300: { radioCommander sideChat "BOMB will explode in about 5 minutes!"; };
    case 480: { radioCommander sideChat "BOMB will explode in about 3 minutes!"; };
    case 540: { radioCommander sideChat "BOMB will explode in about 1 minute!"; };
    case 590: { radioCommander sideChat "BOMB will explode in about 10 seconds!"; };
    default {  };
  };
};

GODLIKE_commanderSayGL =
{
  radioCommander sideChat "We are counting on you. Good luck GHOST.";
};

GODLIKE_commanderSayConvoyStart =
{
  if (!isServer) exitWith {};
  //radioCommander sideChat "GHOST, convoy is heading to the checkpoint. Make sure bomber won't escape takistan. Good Luck.";
  [radioCommander,"GHOST, convoy is heading to the checkpoint. Make sure bomber won't escape this damned country. Good Luck."] remoteExec ["sideChat", 0]; // Execute on every client
};
