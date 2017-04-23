//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Bomb init //
//////////////////////////////////////////
// * Feel free to modify and use this script in any other mission! *
//////////////////////////////////////////




// Exit if headless or dedi
if(!hasInterface) exitWith {};

// ** Client only workaround for isNil bug **
/*if(!isServer) then
  {
    SEQUENCES = [];
    SEQUENCE_CORRECT_INDEX = -1;
    CODE = [];
  };*/


  params ["_SEQUENCES", "_CODE","_SEQUENCE_CORRECT_INDEX"];
  // Don't run on Dedi!!!
  if(!hasInterface) exitWith {};
  hint 'Data synchronization DONE';
  CODEINPUT = [];
  SEQUENCES = _SEQUENCES;
  CODE = _CODE;
  SEQUENCE_CORRECT_INDEX = _SEQUENCE_CORRECT_INDEX;

  // wait until all data is transferred
  //waitUntil {count(SEQUENCES) != 0 && count(CODE) != 0 && SEQUENCE_CORRECT_INDEX != -1};

  // Bomb sequence
  SEQUENCEINPUT = [];
  SEQUENCECURPOS = 0;

  // I would be happy if SQF had Dictionaries or lists or true OOO
  WIRE = ["BLUE", "WHITE", "YELLOW", "GREEN"] call bis_fnc_selectRandom;

  INSTRUCTIONS_CURRENT_INDEX = 0;
  INSTRUCTIONS_CONTENTS = [
  "<t align='center' color='#8B0000' font='PuristaMedium'>"+ (BOMB_TYPES select 0) +" arming guide</t><br/><br/>
  <t align='left' color='#8B0000' font='PuristaMedium'>Description:</t><br/><br/>
  "+ (BOMB_TYPES select 0) +" is a soviet-made explosive weapon that uses the exothermic reaction of an explosive material to provide an extremely sudden and violent release of energy. Detonations inflict damage principally through ground- and atmosphere-transmitted mechanical stress, the impact and penetration of pressure-driven projectiles, pressure damage, and explosion-generated effects.<br/><br/>
  <t align='left' color='#8B0000' font='PuristaMedium'>Warning: Extreme caution is advised. Disarming and arming procedures should only be done by qualified person.</t><br/><br/>
  <t align='left' color='#8B0000' font='PuristaMedium'>Arming guide - Step by step:</t><br/><br/>
  1. "+ (((SEQUENCES select 0) select 7) call COB_fnc_getSequenceFriendlyName) +"<br/>
  2. "+ (((SEQUENCES select 0) select 6) call COB_fnc_getSequenceFriendlyName) +"<br/>
  3. "+ (((SEQUENCES select 0) select 5) call COB_fnc_getSequenceFriendlyName) +"<br/>
  4. "+ (((SEQUENCES select 0) select 4) call COB_fnc_getSequenceFriendlyName) +"<br/>
  5. "+ (((SEQUENCES select 0) select 3) call COB_fnc_getSequenceFriendlyName) +"<br/>
  6. "+ (((SEQUENCES select 0) select 2) call COB_fnc_getSequenceFriendlyName) +"<br/>
  7. "+ (((SEQUENCES select 0) select 1) call COB_fnc_getSequenceFriendlyName) +"<br/>
  8. "+ (((SEQUENCES select 0) select 0) call COB_fnc_getSequenceFriendlyName) +"<br/><br/>
  <t align='left' color='#8B0000' font='PuristaMedium'>Disarmament  procedure:</t><br/><br/>
  In order to disarm the bomb simply reverse arming procedure. Start from point eight and go to the first one.
  ",

  "<t align='center' color='#8B0000' font='PuristaMedium'>"+ (BOMB_TYPES select 1) +" arming guide</t><br/><br/>
  <t align='left' color='#8B0000' font='PuristaMedium'>Description:</t><br/><br/>
  "+ (BOMB_TYPES select 1) +" is a soviet-made Nuclear fission type atomic bombs utilize the energy present in very heavy atomic nuclei, such as U-235 or Pu-239. In order to release this energy rapidly, a certain amount of the fissile material must be very rapidly consolidated while being exposed to a neutron source.The energy released by a nuclear fission bomb may be tens of thousands of times greater than a chemical bomb of the same mass.<br/><br/>
  <t align='left' color='#8B0000' font='PuristaMedium'>Warning: Extreme caution is advised. Disarming and arming procedures should only be done by qualified person.</t><br/><br/>
  <t align='left' color='#8B0000' font='PuristaMedium'>Arming guide - Step by step:</t><br/><br/>
  1. "+ (((SEQUENCES select 1) select 7) call COB_fnc_getSequenceFriendlyName) +"<br/>
  2. "+ (((SEQUENCES select 1) select 6) call COB_fnc_getSequenceFriendlyName) +"<br/>
  3. "+ (((SEQUENCES select 1) select 5) call COB_fnc_getSequenceFriendlyName) +"<br/>
  4. "+ (((SEQUENCES select 1) select 4) call COB_fnc_getSequenceFriendlyName) +"<br/>
  5. "+ (((SEQUENCES select 1) select 3) call COB_fnc_getSequenceFriendlyName) +"<br/>
  6. "+ (((SEQUENCES select 1) select 2) call COB_fnc_getSequenceFriendlyName) +"<br/>
  7. "+ (((SEQUENCES select 1) select 1) call COB_fnc_getSequenceFriendlyName) +"<br/>
  8. "+ (((SEQUENCES select 1) select 0) call COB_fnc_getSequenceFriendlyName) +"<br/><br/>
  <t align='left' color='#8B0000' font='PuristaMedium'>Disarmament  procedure:</t><br/><br/>
  In order to disarm the bomb simply reverse arming procedure. Start from point eight and go to the first one.
  ",

  "<t align='center' color='#8B0000' font='PuristaMedium'>"+ (BOMB_TYPES select 2) +" arming guide</t><br/><br/>
  <t align='left' color='#8B0000' font='PuristaMedium'>Description:</t><br/><br/>
  "+ (BOMB_TYPES select 2) +" is a european-made Nuclear fusion type atomic bomb that release energy through the fusion of the light atomic nuclei of deuterium and tritium. With this type of bomb, a thermonuclear detonation is triggered by the detonation of a fission type nuclear bomb contained within a material containing high concentrations of deuterium and tritium.Nuclear fusion bombs can have arbitrarily high yields making them hundreds or thousands of times more powerful than nuclear fission.<br/><br/>
  <t align='left' color='#8B0000' font='PuristaMedium'>Warning: Extreme caution is advised. Disarming and arming procedures should only be done by qualified person.</t><br/><br/>
  <t align='left' color='#8B0000' font='PuristaMedium'>Arming guide - Step by step:</t><br/><br/>
  1. "+ (((SEQUENCES select 2) select 7) call COB_fnc_getSequenceFriendlyName) +"<br/>
  2. "+ (((SEQUENCES select 2) select 6) call COB_fnc_getSequenceFriendlyName) +"<br/>
  3. "+ (((SEQUENCES select 2) select 5) call COB_fnc_getSequenceFriendlyName) +"<br/>
  4. "+ (((SEQUENCES select 2) select 4) call COB_fnc_getSequenceFriendlyName) +"<br/>
  5. "+ (((SEQUENCES select 2) select 3) call COB_fnc_getSequenceFriendlyName) +"<br/>
  6. "+ (((SEQUENCES select 2) select 2) call COB_fnc_getSequenceFriendlyName) +"<br/>
  7. "+ (((SEQUENCES select 2) select 1) call COB_fnc_getSequenceFriendlyName) +"<br/>
  8. "+ (((SEQUENCES select 2) select 0) call COB_fnc_getSequenceFriendlyName) +"<br/><br/>
  <t align='left' color='#8B0000' font='PuristaMedium'>Disarmament  procedure:</t><br/><br/>
  In order to disarm the bomb simply reverse arming procedure. Start from point eight and go to the first one.
  "];

  if(count SEQUENCES != 3) then
    {
      hint 'Critical failure occured, please report to map creator!';
      hint 'Critical failure occured, please report to map creator!';
      hint 'Critical failure occured, please report to map creator!';
      cutText ["Critical failure occured, please report to map creator!","PLAIN",2];

    };

  execVM "DEFUSE\instructionsOnLoad.sqf";
  execVM "DEFUSE\explosivePadOnLoad.sqf";
  execVM "DEFUSE\explosivePadOnUnload.sqf";
