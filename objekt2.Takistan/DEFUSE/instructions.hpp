class InstructionsDefuse
{
	idd = 1201;
	movingEnable = 1;
    enableSimulation = 1;
	controlsBackground[] = {};
  	objects[] = {};
      onLoad = "_this call InstructionsOnLoad";

      class controls
      {
        class InstructionsBackground
    		{
          access = 0;
          type = CT_STATIC;
          idc = -1;
          style = ST_LEFT;
    			colorBackground[] = { 1, 1, 1, 1 };
          //["","","",""]
          x = 0.29375 * safezoneW + safezoneX;
    			y = 0.071 * safezoneH + safezoneY;
    			w = 0.4125 * safezoneW;
    			h = 0.869 * safezoneH;
    			text = "";
          colorText[] = {0,0,0,0};
          font = "TahomaB";
          sizeEx = 0.04;
    		};

        class ContentText : RscStructuredText
        {
          idc = 1200;
    			type = CT_STRUCTURED_TEXT;
    			style = ST_MULTI;
          x = 0.314375 * safezoneW + safezoneX;
          y = 0.104 * safezoneH + safezoneY;
          w = 0.37125 * safezoneW;
          h = 0.814 * safezoneH;
          colorText[] = {0,0,0,1};
          colorBackground[] = {0,0,0,0};
          font = "PuristaLight";
          sizeEx = 0.05;
          lineSpacing = 1;
          shadow = 0;
					borderSize = 0;
          text = "";
					class Attributes
				  {
				    font = "PuristaMedium";
				    color = "#000000";
				    align = "left";
				    valign = "middle";
				    shadow = false;
				    shadowColor = "#ff0000";
				    size = "1";
				  };
        };
      }
}
