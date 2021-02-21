/*
// Control types
#define CT_STATIC 0

// Static styles

//#define ST_LEFT           0x00

#define ST_LEFT	0
#define ST_RIGHT	1
#define ST_CENTER	2
#define ST_UP		3
#define ST_DOWN	4
#define ST_VCENTER	5

#define ST_SINGLE	0
#define ST_MULTI	16
#define ST_PICTURE	48
#define ST_FRAME	64

#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE	176

#define ST_SHADOW	256
#define ST_NO_RECT	512

#define FontM "Bitstream"
#define ST_LEFT      0
#define ST_RIGHT     1
#define ST_CENTER    2
#define CT_STATIC    0
*/

class RscText_AAF_LoadScreen {
	access = 0;
	idc = -1;
	type = 0; //CT_STATIC;
	style = 48 + 2048 //ST_PICTURE;	//style = ST_LEFT;
	colorBackground[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	//w = 0.1; h = 0.05;
	//x and y are not part of a global class since each rsctext will be positioned 'somewhere'
	font = "TahomaB";		//font = "Bitstream";
	sizeEx = 0;			//sizeEx = 0.04;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
};

 class AAF_LoadScreen {
	idd= -1;/////////////////////////////////////////////////////////
	movingEnable=0;
	duration= 7;
	fadein=0;
	name="AAF_LoadScreen";
	controlsBackground[] = {};
	controls[]={Bild};
	class Bild : RscText_AAF_LoadScreen {
		idc = 1200;		//1200
		text="img\AAFlogo.paa";	//or.jpg
		x = 0 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 1 * safezoneW;
		h = 1 * safezoneH;
	};
};
