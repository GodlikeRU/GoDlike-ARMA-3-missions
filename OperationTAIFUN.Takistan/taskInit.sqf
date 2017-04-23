//////////////////////////////////////////
 //  ARMA 3 SQF FILE //
 //  AUTHOR: GODLIKE //
 // PURPOSE: Tasks initialization //
//////////////////////////////////////////


// Task creation
["TSK_getDocuments",WEST,["<img image='textures\takistanGetdocuments.paa' width='367' height='184'/><br/><br/>ISIS intelligence managed to find out identity of some of our agents. Retrieve this information before they will be transmitted to the ISIS command.","Retrieve terrorist's intel",""],getMarkerPos "marker_13","Assigned",100,true,false] call BIS_fnc_setTask;
["TSK_destroyRadio",WEST,["<img image='textures\takistanRadioStation.paa' width='367' height='184'/><br/><br/>Destroying the radio station disables ability of calling enemy reinforcements from near ISIS base. Intel says there's a radiooperator in enemy base that will try to call for reinforcements when base is attacked so watch out!<br/><br/>Try NOT to attract armored forces from military base on the south or they will come in great numbers!","Destroy radio station",""],getMarkerPos "marker_18","Created",99,false,false] call BIS_fnc_setTask;
["TSK_blowUpFuelStation",WEST,["<img image='textures\takistanFuelStation.paa' width='367' height='184'/><br/><br/>Blowing up fuel station will attract armored vehicles from town where ISIS leader is located making killing him significantly easier.","Blow up fuel station",""],getMarkerPos "marker_15","Created",98,false,false] call BIS_fnc_setTask;
["TSK_killLeader",WEST,["<img image='textures\enemyleader.paa'/><br/><br/>Enemy leader Abdul Ak-Sahrim is hiding in Karachinar town at the north.<br/>Kill him to weaken enemy greatly.","Kill enemy leader",""],getMarkerPos "marker_33","Created",97,false,false] call BIS_fnc_setTask;
["TSK_extraction",WEST,["<img image='textures\takistanExtraction3.paa' width='367' height='184'/><br/><br/>Extract from enemy territory","Extraction",""],getMarkerPos "marker_32","Created",96,false,false] call BIS_fnc_setTask;

// Diary creation
player createDiaryRecord ["Diary", ["Situation", "
==================================================<br/>
Situation<br/>
==================================================<br/>
We are at the <font color='#f4b342'>Rasman</font> military base. We should split to two teams as our objectives are located in two, far from each other places. There's a lot to do so better move out fast before night comes.<br/><br/>
==================================================<br/>
Our forces<br/>
==================================================<br/>
Thankfully we still have one of <font color='#a3f441'>Apache</font> helictopers working in our homebase. Use it with caution as enemy probably have AA support. <br/><br/>
As for the armored support, we don't have anything other than <font color='#a3f441'>HUMVEE's</font>, however terrorists have small and barely secured <marker name='marker_38'>military base</marker> where we can gather armored vehicles support. Intel says there's at least one <font color='#a3f441'>BMP</font> which will help us greatly while we do our objectives.<br/><br/>
==================================================<br/>
Enemy forces<br/>
==================================================<br/>
Enemy have big amount of armored support units (6-10). Their vehicles are mostly outdated and  consists of WW2 <font color='#a3f441'>tanks</font> and cold-war era <font color='#a3f441'>APC's</font> but we should not underestimate them. If used right they can still be deadly, especially for our gunship.<br/><br/>
Most of enemy <font color='#a3f441'>tanks</font> resides in Ravanay and Karachinar. Theoretically we should not even encounter any of them.<br/>At leasts one <font color='#a3f441'>APC</font> was spotted patrolling fuel station and there were also a few <font color='#a3f441'>UAZ's</font> with Machine guns patrolling roads between towns.<br/><br/>
As for the infantry, their equipment is a combination of every nation's weapons. Most of them uses soviet cold-war era weapons but our intelligence spotted also a few guys with USA's weaponry as well as german-made carbines. <br/><br/>
Their Portable launchers are a bit old but still very dangerous <font color='#41f4a6'>9K38 Igla</font> AA launcher and <font color='#41f4a6'>RPG-7</font> AT launcher. Extreme caution is advised when driving around towns and enemy bases.
"]];

player createDiaryRecord ["Diary", ["Political information", "==================================================<br/>
Political information<br/>
==================================================<br/>Here we are, in Takistan. USA can't simply stand aside and watch how Russia is being called 'Hero' in mass media because they're the only one to support Takistan's government in their fight.<br/><br/>
We will strike today to show everyone that USA is still monitoring the situation. Don't dissapoint us."]];


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
} count ['TSK_getDocuments','TSK_destroyRadio','TSK_killLeader', 'TSK_blowUpFuelStation'] == 4", "EXTRACTION_ALLOWED = true;" , ""];


/*
this && ({group _x == my_group} count thislist) == count units my_group && (EXTRACTION_ALLOWED)*/
/*
["TSK_getDocuments",WEST,["Wywiadowi ISIS udało się odkryć tożsamość kilku naszych agentów. Przejmij te informacje zanim zostaną przetransmitowane do dowództwa bojowników.","Zdobądź dokumenty bojowników",""],getMarkerPos "marker_13","Assigned",100,true,true] call BIS_fnc_setTask;
["TSK_destroyRadio",WEST,["Zniszczenie stacji nadawczej uniemożliwi wrogowi wezwanie posiłków z niedalekiej bazy ISIS. ","Zniszcz stację nadawczą",""],getMarkerPos "marker_18","Created",99,false,true] call BIS_fnc_setTask;
["TSK_blowUpFuelStation",WEST,["Wysadzenie stacji paliw odciągnie część wrogich czołgów z miasta co pozwoli łatwiej wyeliminować przywódcę. ","Wysadź stację paliw",""],getMarkerPos "marker_15","Created",98,false,true] call BIS_fnc_setTask;
["TSK_killLeader",WEST,["Lider terrorystów Abdul Ak-Sahrim ukrywa się w mieście Karaczinar na północy. Wyeliminuj go aby znacząco osłabić nieprzyjeciela.","Zabij lidera bojowników",""],getMarkerPos "marker_33","Created",97,false,true] call BIS_fnc_setTask;
["TSK_extraction",WEST,["Ucieknij z obszaru nieprzyjaciela","Uciekaj",""],getMarkerPos "marker_32","Created",96,false,true] call BIS_fnc_setTask;
*/
