import RscPicture;
import RscButton;
import RscListBox;

class GR_guiNeuDialog
{
	idd = 7777;
	
	class ControlsBackground
	{
		class Background
		{
			type = 0;
			idc = 1000;
			x = safeZoneX + safeZoneW * 0.23730469;
			y = safeZoneY + safeZoneH * 0.26215278;
			w = safeZoneW * 0.52539063;
			h = safeZoneH * 0.58854167;
			style = 2;
			text = "";
			colorBackground[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25)*1);
			
		};
		class Background_darkener: RscPicture
		{
			idc = 999;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.588 * safezoneH;
			colorBackground[] = {1,1,1,1};
			text = "\A3\ui_f\data\GUI\rsc\rscdisplaymain\hover_ca.paa";
		};
		class Background_Header
		{
			type = 0;
			idc = 2000;
			x = safeZoneX + safeZoneW * 0.2375;
			y = safeZoneY + safeZoneH * 0.12666667;
			w = safeZoneW * 0.525;
			h = safeZoneH * 0.13666667;
			style = 0+2;
			text = "Loadouts";
			colorBackground[] = {0.9,0.6,0.1,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = 0.09/ (getResolution select 5);
			shadow = 1;
			
		};
		class Picture
		{
			type = 0;
			idc = 1599;
			x = safeZoneX + safeZoneW * 0.24414063;
			y = safeZoneY + safeZoneH * 0.13888889;
			w = safeZoneW * 0.06542969;
			h = safeZoneH * 0.109375;
			style = 48;
			text = "images\GermanRangersLogo.paa";
			colorBackground[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25)*1);
			
		};
		
	};
	class Controls
	{
		class LoadoutList: RscListbox
		{
			type = 5;
			idc = 1500;
			x = safeZoneX + safeZoneW * 0.39746094;
			y = safeZoneY + safeZoneH * 0.31770834;
			w = safeZoneW * 0.20410157;
			h = safeZoneH * 0.37847223;
			
			/*
			style = 16;
			colorBackground[] = {0.302,0.302,0.302,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.902,0.902,0.902,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25)*1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			*/
			
		};
		class Cancel
		{
			type = 1;
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.69726563;
			y = safeZoneY + safeZoneH * 0.13888889;
			w = safeZoneW * 0.05957032;
			h = safeZoneH * 0.109375;
			style = 0+2;
			text = "X";
			borderSize = 1;
			colorBackground[] = {0.702,0.102,0.102,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,0};
			colorBorder[] = {1,1,1,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0};
			colorShadow[] = {0.302,0.302,0.302,0};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			offsetPressedX = 0.0;
			offsetPressedY = 0.0;
			offsetX = 0.0;
			offsetY = 0.0;
			sizeEx = 0.09/ (getResolution select 5);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			action = "closeDialog 0;";
			
		};
		class Confirm_Loadout : RscButton 
		{
			idc = 1614;
			x = safeZoneX + safeZoneW * 0.3984375;
			y = safeZoneY + safeZoneH * 0.73784723;
			w = safeZoneW * 0.203125;
			h = safeZoneH * 0.08506945;
			text = "Ausrüsten";			
			onButtonClick = "";
			/*
			colorBackground[] = {0.898,0.6,0.102,1};
			colorBackgroundActive[] = {0.898,0.6,0.102,1};
			colorFocused[] = {0.898,0.6,0.102,1};
			colorShadow[] = {0.302,0.302,0.302,1};
			font = "PuristaMedium";
			sizeEx = 0.07/ (getResolution select 5);
			shadow = 1;		
			*/			
		};
		
	};
	
};
