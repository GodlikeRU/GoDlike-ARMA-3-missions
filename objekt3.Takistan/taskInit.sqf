//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Tasks initialization //
//////////////////////////////////////////

// Loc     <font color='#f4b342'>
// weapon  <font color='#41f4a6'>
// vehicle <font color='#a3f441'>
// radio   <font color='#d2e52b'>

// Task creation
["TSK_clearCheckpoint",EAST,["<img image='textures\objekt3_clearcheckpoint.paa' width='367' height='184'/><br/><br/>Enemy have a small checkpoint over here, don't expect heavy resistance  but try not to alarm units from the main base. There is a AA battery there and some AT defenses aimed at the town. They are thinking they'll use it against our tanks when we move to the town. You have to explain to them that they're wrong.","Clear north checkpoint",""],getMarkerPos "marker_95","Assigned",100,true,false] call BIS_fnc_setTask;

["TSK_disableArtillery",EAST,["<img image='textures\objekt3_destroyArtillery.paa' width='367' height='184'/><br/><br/>ISIS <font color='#a3f441'>Katyusha's</font> were spotted here. It's important for us to disable or destroy them to prevent our forces assaulting the town getting slaughtered by artillery. You can kill it's crew and use them to suppress enemy infantry or blow up vehicles entirely, it's your choice.<br/><br/>They still haven't finished defenses at this base yet but they probably have armored support there so don't assault like uraaa it from the main road.<br/><br/>
<font color='#a3f441'>Katyusha's</font> can't fire at close targets so don't worry if arty spots you.<br/><br/>
","Disable enemy rocket artillery",""],getMarkerPos "marker_86","Created",99,false,false] call BIS_fnc_setTask;

["TSK_ambushEnemyReinforcements",EAST,["<img image='textures\objekt3_destroyConvoy.paa' width='367' height='184'/><br/><br/>Entire platoo of <font color='#a3f441'>T-55</font> tanks is currently being repaired at Anar. They will surely try to stop our forces when you call friendly attack on First defense line. You can easily ambush them if you secure south road. Their presumed drive path is displayed on the map. <br/><br/>
Our intelligence suggests to ambush them at <marker name='marker_cos'>this</marker> positon but it's your choice.","Ambush enemy tanks",""],getMarkerPos "marker_cos","Created",98,false,false] call BIS_fnc_setTask;


["TSK_breakFirstLine",EAST,["<img image='textures\objekt3_clear1stline.paa' width='367' height='184'/><br/><br/>They set up this defense line as the strongest one. Expect heavy resistance including tanks, APC's and stationary AT and AA guns. Extreme caution is advised driving around there due to AT infantry so better approach it on foot with tank support from far place.<br/><br/>
Remember that you can call <font color='#d2e52b'>0-0-1</font> to signal our forces that you need help on the first defense line.","Break through first defense line",""],getMarkerPos "marker_66","Created",97,false,false] call BIS_fnc_setTask;

["TSK_breakSecondLine",EAST,["<img image='textures\objekt3_clear2ndline.paa' width='367' height='184'/><br/><br/>This is the second line of defense. It's significantly weaker than the first one but it's still strong if you attack it unprepared. Like at First defense line there are tanks, APC's and stationary guns, just in lower numbers. ","Break through second defense line",""],getMarkerPos "marker_67","Created",96,false,false] call BIS_fnc_setTask;

["TSK_captureTown",EAST,["<img image='textures\objekt3_destroyBase.paa' width='367' height='184'/><br/><br/>When you deal with the other tasks you can finally attack the <font color='#f4b342'>Feruz Abad</font> town together. Leave none of their soldiers alive. Capture the town at all costs, you can even demolish them with artillery fire, we don't care. Success is the only important thing here.","Capture Feruz Abad",""],getMarkerPos "marker_79","Created",95,false,false] call BIS_fnc_setTask;

["TSK_extraction",EAST,["<img image='textures\objekt2_extraction.paa' width='367' height='184'/><br/><br/>Extract from enemy territory to secure Russian base","Extraction",""],getMarkerPos "marker_77","Created",94,false,false] call BIS_fnc_setTask;

// Diary creation
player createDiaryRecord ["Diary", ["Situation", "
==================================================<br/>
Situation<br/>
==================================================<br/>
Finally this day came. We are at the <font color='#f4b342'>Jilavur</font> military base on the frontline. Thanks to our specnaz units we can now assault the town with full force. <br/><br/>
Enemy dug in at the <font color='#f4b342'>Feruz Abad</font> town. They prepared two defense lines. We need to break through them. You need to split to two teams. One should head to north of the town and the other one with tank to south.<br/><br/>
DO NOT assault the defense lines alone. When you are ready call <font color='#d2e52b'>0-0-1</font> for the friendly forces to attack from our base. We prepared two <font color='#a3f441'>T-80</font> tanks and two <font color='#a3f441'>BTR-80s</font> full of infantry to support you. Be aware that this will trigger all enemy units from town to defense their positions so expect heavy resistance.<br/><br/>
In the north there's enemy <font color='#f4b342'>Checkpoint</font> north of the town. We also have information about enemy rocket artillery units in <font color='#f4b342'>Falar</font> city. Don't enter the town until you dealt with them or they'll toast you. Remember that you can always kill enemy artillery crew and use it to support our attack on the defense lines. After you deal with the artillery you can attack enemy HQ from the north together with south team.<br/><br/>
In the south there are few small villages that contains enemy infantry. There shouldn't be any armored support heavier than a truck so you should cut through them like a knife through butter with your tank. We know however, that a lot of <font color='#a3f441'>T-55</font> tanks are being repaired in <font color='#f4b342'>Anar</font>. When they will spot our army heading to the town then they'll move to <font color='#f4b342'>First defense line</font> through road in the south to support ISIS defenses. That's where south team with tank come in. Ambush enemy tanks heading to first defense line and then support our attack at the second line and town. You've been supplied with a lot of Anti-tank weapons if your tank gets destroyed but try not to lose it.<br/><br/>
Try to eliminate their AA guns so our chopper can support you in every fight, it's guided rockets are deadly for both infantry and vehicles.
==================================================<br/>
Our forces<br/>
==================================================<br/>
We have two  <font color='#a3f441'>Tigr</font> cars for our transport. There's also <font color='#a3f441'>T-72B3</font> that we can use. <br/><br/>
As for air support we've got heavy attack helicopter <font color='#a3f441'>Mi-28N</font>. For transportation purposes Russian HQ provided us <font color='#a3f441'>Ka-60</font>.<br/><br/>
We should not touch <font color='#a3f441'>BMPs</font>, <font color='#a3f441'>BTRs</font>  or <font color='#a3f441'>T-80s</font> as they're intented for other teams attacking the city with us.
==================================================<br/>
Enemy forces<br/>
==================================================<br/>
Enemy have big amount of armored support units (6-10). Their vehicles are mostly outdated and  consists of WW2 <font color='#a3f441'>tanks</font> and cold-war era <font color='#a3f441'>APC's</font>. We also spotted some newer <font color='#a3f441'>tanks</font> like <font color='#a3f441'>T-72s</font> with reactive armor so better save your best ammo for them.<br/><br/>
Most of enemy forces are on the <font color='#f4b342'>first</font> and <font color='#f4b342'>second</font> defense lines near <font color='#f4b342'>Feruz Abad</font>.Their defense consists of <font color='#a3f441'>tanks</font> combined with <font color='#a3f441'>APCs</font> and <font color='#41f4a6'>heavy MGs</font> but don't be surprised if you spot a <font color='#41f4a6'>AT gun</font> there, they're changing layout often to mislead us.<br/><br/>
At leasts one <font color='#a3f441'>UAZ</font> with Machine gun is patrolling roads. There may be also a <font color='#a3f441'>APC</font> or a <font color='#a3f441'>tank</font> patrolling with the rest.<br/><br/>
There are three rocket artillery units in <font color='#f4b342'>Falar</font> city. We're not sure which version of Katyusha it is but it's deadly for sure.
As for the infantry, their equipment is a combination of every nation's weapons. Most of them uses soviet cold-war era weapons but our intelligence spotted also a few guys with USA's weaponry as well as german-made carbines. <br/><br/>
Our intelligence says they are running low on portable AA launchers so their only AA defense are stationary guns marked on your map. They still have a lot of  <font color='#41f4a6'>RPG-7</font> AT launchers. Extreme caution is advised when driving around towns and enemy bases. Even reactive armor of our tanks won't save you from <font color='#41f4a6'>RPG-7WR</font> tandem warhead.
"]];

player createDiaryRecord ["Diary", ["Political information", "==================================================<br/>
Political information<br/>
==================================================<br/>
It's April 2017 in Takistan. We made huge progress past year in destroying ISIS and we hope to crush them by the end of the year. Campaign is a success for us, both in politics and war terms. We are getting more and more feared in other countries, our plan seems to work well.<br/><br/>
The one and only problem in our campaign is (as always) the USA. They started their operation in Takistan after our numerous successes. They want to rule global politics once again but we won't let them. We need to strike fast and gain control of majority of Takistan before they do. We still have initial advantage, let's not lose it."]];


// Ending mission trigger
_trg_taskcomplete =createTrigger["EmptyDetector",getPos player];
_trg_taskcomplete setTriggerArea [0, 0, 0, false];
_trg_taskcomplete setTriggerActivation ["NONE", "present", true];
_trg_taskcomplete setTriggerTimeout [0, 0, 0, true];
_trg_taskcomplete setTriggerStatements["{
   if ( [_x] call bis_fnc_taskExists ) then {
       [_x] call bis_fnc_taskCompleted
   }else{
       false
   };
} count ['TSK_clearCheckpoint','TSK_disableArtillery','TSK_breakFirstLine', 'TSK_breakSecondLine', 'TSK_ambushEnemyReinforcements', 'TSK_captureTown'] == 6", "EXTRACTION_ALLOWED = true; call GODLIKE_commanderSayExtractionAllowed;" , ""];


/*
trigger_firstLineCleared
trigger_secondLineCleared
trigger_townCleared
trigger_checkpointCleared

vehicle_NorthBaseKatiusza03
vehicle_TankReinforcement01
*/
