//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Tasks initialization //
//////////////////////////////////////////


// Task creation
["TSK_findCode",EAST,["<img image='textures\objekt2_findCode.paa' width='367' height='184'/><br/><br/>If we stay undetected we will be able to defuse the bomb using the code in seconds. Find it before proceeding to the town.","Find code to the bomb",""],getMarkerPos "marker_41","Assigned",100,true,false] call BIS_fnc_setTask;
["TSK_killBomber",EAST,["<img image='textures\objekt2_killBomber.paa' width='367' height='367'/><br/><br/>We need to kill the guy that did the dirty bomb in <font color='#f4b342'>Feruz Abad</font>. If we eliminate him stealthy then enemies will surely think twice before doing something like planting the bomb in future.<br/><br/>
He's currently trying to leave Takistan. Convoy with him will start from <marker name='Anar'>Anar</marker> and move to Checkpoint on the south where's his escape helicopter. Our agents put a bug in his car so we will know where he is on the map. Column will start moving at 23:30. It's up to You to decide whether to get code first or ambush the bomber. Just don't not let him ran away.<br/><br/>
Our informant suggests to ambush him at <marker name='marker_3'>this</marker> positon but it's your choice","Kill bomber",""],getMarkerPos "marker_79","Created",99,false,false] call BIS_fnc_setTask;
["TSK_defuseBomb",EAST,["<img image='textures\objekt2_defuseBomb.paa' width='367' height='184'/><br/><br/>This bomb is pain in the arse for our forces. We can't strike at <font color='#f4b342'>Feruz Abad</font> until you defuse that piece of shit because they have watchtowers all over the main route.<br/><br/>We need You to move into the town undetected, from enemy territory, so you won't get spotted by these watchtowers <marker name='marker_80'>here</marker> and <marker name='marker_81'>here</marker>.<br/><br/> Watch out for patrols. If they see you then defuse code will become useless and you will need to disable bomb manually. There should be some documents about it in the bomb's building.","Defuse the bomb",""],getMarkerPos "marker_68","Created",98,false,false] call BIS_fnc_setTask;
["TSK_extraction",EAST,["<img image='textures\objekt2_extraction.paa' width='367' height='184'/><br/><br/>Extract from enemy territory to secure Russian base","Extraction",""],getMarkerPos "marker_77","Created",97,false,false] call BIS_fnc_setTask;

// Diary creation
player createDiaryRecord ["Diary", ["Situation", "
==================================================<br/>
Situation<br/>
==================================================<br/>
We are at the <font color='#f4b342'>Jilavur</font> military base on the frontline. Road ahead is blocked and we're waiting for You to complete your mission before we strike.<br/><br/>
Enemy dug in at the <font color='#f4b342'>Feruz Abad</font> town. They did a bomb and they threaten us that they'll detonate it if we move to the town. That's where you come in. Do it and we'll have another major town in Takistan. You should also kill the guy who did the bomb, if he's dead then no more bombs will appear, right?<br/><br/>
We go in the night so most of enemies should sleep already, that way we shouldn't see any heavy weaponry like tanks or artillery.
==================================================<br/>
Our forces<br/>
==================================================<br/>
We have two  <font color='#a3f441'>Tigr</font> cars for our disposal. One is with <font color='#41f4a6'>MG</font> and one without it. Use it with caution as it's stealth mission. <br/><br/>
We shouldn't need any other vehicles. Our targets aren't so far from each other and we don't want to make unneeded noise in the enemy territory.
==================================================<br/>
Enemy forces<br/>
==================================================<br/>
Enemy have big amount of armored support units (6-10). Their vehicles are mostly outdated and  consists of WW2 <font color='#a3f441'>tanks</font> and cold-war era <font color='#a3f441'>APC's</font> but we should not underestimate them. If used right they can still be deadly.<br/><br/>
Most of enemy forces resides in <font color='#f4b342'>Feruz Abad</font> but we have some reports that they have some armored units at south checkpoint . Theoretically we should not even encounter any of them.<br/>At leasts one <font color='#a3f441'>APC</font>  was spotted patrolling the town and there were also a few <font color='#a3f441'>UAZ's</font> with Machine guns patrolling roads between towns.<br/><br/>
Watch out for town <font color='#f4b342'>Sakhe</font> between the frontlines. There may be enemy forces there though it's not guaranteed.<br/><br/>
As for the infantry, their equipment is a combination of every nation's weapons. Most of them uses soviet cold-war era weapons but our intelligence spotted also a few guys with USA's weaponry as well as german-made carbines. <br/><br/>
Their Portable launchers are a bit old but still very dangerous <font color='#41f4a6'>9K38 Igla</font> AA launcher and <font color='#41f4a6'>RPG-7</font> AT launcher. Extreme caution is advised when driving around towns and enemy bases.
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
} count ['TSK_findCode','TSK_killBomber','TSK_defuseBomb'] == 3", "EXTRACTION_ALLOWED = true;" , ""];


/*
this && ({group _x == my_group} count thislist) == count units my_group && (EXTRACTION_ALLOWED)*/
/*
["TSK_getDocuments",WEST,["Wywiadowi ISIS udało się odkryć tożsamość kilku naszych agentów. Przejmij te informacje zanim zostaną przetransmitowane do dowództwa bojowników.","Zdobądź dokumenty bojowników",""],getMarkerPos "marker_13","Assigned",100,true,true] call BIS_fnc_setTask;
["TSK_destroyRadio",WEST,["Zniszczenie stacji nadawczej uniemożliwi wrogowi wezwanie posiłków z niedalekiej bazy ISIS. ","Zniszcz stację nadawczą",""],getMarkerPos "marker_18","Created",99,false,true] call BIS_fnc_setTask;
["TSK_blowUpFuelStation",WEST,["Wysadzenie stacji paliw odciągnie część wrogich czołgów z miasta co pozwoli łatwiej wyeliminować przywódcę. ","Wysadź stację paliw",""],getMarkerPos "marker_15","Created",98,false,true] call BIS_fnc_setTask;
["TSK_killLeader",WEST,["Lider terrorystów Abdul Ak-Sahrim ukrywa się w mieście Karaczinar na północy. Wyeliminuj go aby znacząco osłabić nieprzyjeciela.","Zabij lidera bojowników",""],getMarkerPos "marker_33","Created",97,false,true] call BIS_fnc_setTask;
["TSK_extraction",WEST,["Ucieknij z obszaru nieprzyjaciela","Uciekaj",""],getMarkerPos "marker_32","Created",96,false,true] call BIS_fnc_setTask;
*/
