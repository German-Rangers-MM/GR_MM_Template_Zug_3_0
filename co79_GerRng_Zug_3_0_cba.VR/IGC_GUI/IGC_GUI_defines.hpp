/*
    Killah Potatoes GUI defines and functions

    File: IGC_GUI_defines.hpp
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-07-10
    Last Update: 2018-09-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    UI defines and functions used in mods and missions from the Killah Potatoes Gaming Community.
*/

// Prefix for this use case to avoid issues with duplicated definitions
#define IGC_GUI_PRE                       IGC_LIB

/*
    --- General Defines ---
*/

// Text sizes
#define IGC_TEXT_XS                      safeZoneH * 0.016
#define IGC_TEXT_S                       safeZoneH * 0.018
#define IGC_TEXT_M                       safeZoneH * 0.02
#define IGC_TEXT_L                       safeZoneH * 0.025
#define IGC_TEXT_XL                      safeZoneH * 0.03

// Constant values for calculation
#define IGC_SPACING_X                    0.002
#define IGC_SPACING_Y                    0.004
#define IGC_HEIGTH_TITLE                 0.035
#define IGC_HEIGTH_BUTTON                0.025

// Colors
#define IGC_COLOR_PLAYERDEFINE           {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"}
#define IGC_COLOR_BACKGROUND             {0, 0, 0, 0.5}
#define IGC_COLOR_BACKGROUND_LOWVIS             {0, 0, 0, 0.8}

// Leftovers from the old framework. Will be removed/replaced in further development
#define COLOR_BROWN                     {0.30, 0.25, 0.2, 0.75}
#define COLOR_GREEN                     {0.2, 0.23, 0.18, 0.75}
#define COLOR_WHITE                     {1, 1, 1, 1}
#define COLOR_NOALPHA                   {0, 0, 0, 0}
#define COLOR_BLACK                     {0, 0, 0, 1}
#define COLOR_OPFOR_NOALPHA             {1, 0, 0, 1}

/*
    --- Functions ---
*/

/*
    Get X coordinate
    Example: IGC_GETCX(IGC_X_VAL,IGC_WIDTH_VAL,2,4)
    IGC_X_VAL -> Left offset of the left dialog side from the edge of the screen
    IGC_WIDTH_VAL -> Width of the whole dialog (IGC_X_VAL spacing to the left and to the right)
    2 -> Coordinate of the 3rd element position (0,1,2,3,etc.)
    4 -> In relation to a 4 element X grid

    GETX is for a coordinate in relation to the whole dialog width
    GETCX is for a coordinate in relation to the content area (which has an equal spacing to all sides)
*/

#define IGC_GETX(XVAL,WVAL,POS,GRID)     safeZoneX + safeZoneW * (XVAL + POS * (WVAL + IGC_SPACING_X) / GRID)
#define IGC_GETCX(XVAL,WVAL,POS,GRID)    safeZoneX + safeZoneW * (XVAL + (POS * WVAL + (GRID - POS) * IGC_SPACING_X) / GRID)
#define IGC_GETX_CROSS(XVAL)             safeZoneX + safeZoneW * (1 - XVAL - 0.02)

/*
    Get Y coordinate
    Example: IGC_GETCY(IGC_Y_VAL,IGC_HEIGHT_VAL,3,8)
    IGC_Y_VAL -> Top offset of the dialog top from the edge of the screen
    IGC_HEIGHT_VAL -> Height of the area between title bar and bottom buttons in the dialog
    3 -> Coordinate of the 4th element position (0,1,2,3,etc.)
    8 -> In relation to a 8 element Y grid

    GETY_AREA is for the Y coordinate of the beginning of the background (which frames the content area)
    GETY_BELOW is for the Y coordinate of the buttons below the background
*/
#define IGC_GETCY(YVAL,HVAL,POS,GRID)    safeZoneY + safeZoneH * ((YVAL + IGC_HEIGTH_TITLE + IGC_SPACING_Y) + (POS * HVAL + (GRID - POS) * IGC_SPACING_Y) / GRID)
#define IGC_GETY_CROSS(YVAL)             safeZoneY + safeZoneH * (YVAL + 0.005)
#define IGC_GETY_AREA(YVAL)              safeZoneY + safeZoneH * (YVAL + IGC_HEIGTH_TITLE + IGC_SPACING_Y)
#define IGC_GETY_BELOW(YVAL,HVAL)        safeZoneY + safeZoneH * (YVAL + IGC_HEIGTH_TITLE + 2 * IGC_SPACING_Y + HVAL)

/*
    Get width for an element
    Example: IGC_GETW(IGC_WIDTH_VAL,2)
    IGC_WIDTH_VAL -> Width of the whole dialog (IGC_X_VAL spacing to the left and to the right)
    2 -> Width for an element which fits 2 times in the content area from left to right (substracted by spacings to other elements left and right)

    GETW is in relation to the content area
    GETWPLAIN is in relation to the whole dialog width (for the buttons below for example)
*/
#define IGC_GETW(WVAL,GRID)             safeZoneW * ((WVAL - (GRID + 1) * IGC_SPACING_X) / GRID)
#define IGC_GETWPLAIN(WVAL,GRID)        safeZoneW * ((WVAL - (GRID - 1) * IGC_SPACING_X) / GRID)

/*
    Get height for an element
    Example: IGC_GETH(IGC_HEIGHT_VAL,10)
    IGC_HEIGHT_VAL -> Height of the area between title bar and bottom buttons in the dialog
    10 -> Height for an element which fits 10 times in the content area from top to bottom (substracted by spacings to other elements above and below)
*/
#define IGC_GETH(HVAL,GRID)             safeZoneH * ((HVAL - (GRID + 1) * IGC_SPACING_Y) / GRID)

/*
    --- Standard sized dialog components ---
    (X from 0.25 - 0.75, Y from 0.2 - 0.8)
*/

#define IGC_X_VAL                        0.25
#define IGC_Y_VAL                        0.2

#define IGC_WIDTH_VAL                    (1 - 2 * IGC_X_VAL)
#define IGC_HEIGHT_VAL                   (1 - 2 * IGC_Y_VAL - IGC_HEIGTH_TITLE - IGC_HEIGTH_BUTTON - 2 * IGC_SPACING_Y)

/*
    --- Large sized dialog components ---
    (X from 0.15 - 0.85, Y from 0.15 - 0.85)
*/

#define IGC_X_VAL_L                      0.15
#define IGC_Y_VAL_L                      0.15

#define IGC_WIDTH_VAL_L                  (1 - 2 * IGC_X_VAL_L)
#define IGC_HEIGHT_VAL_L                 (1 - 2 * IGC_Y_VAL_L - IGC_HEIGTH_TITLE - IGC_HEIGTH_BUTTON - 2 * IGC_SPACING_Y)

/*
    --- Corner dialog components ---
    (X from 0.035 - 0.235, Y from 0.05 - 0.8)
*/

#define IGC_X_VAL_C                      0.035
#define IGC_Y_VAL_C                      0.05

#define IGC_WIDTH_VAL_C                  0.2
#define IGC_HEIGHT_VAL_C                 (0.75 - IGC_HEIGTH_TITLE - IGC_HEIGTH_BUTTON - 2 * IGC_SPACING_Y)

/*
    --- Small dialog components ---
    (X from 0.3 - 0.7, Y from 0.05 - 0.8)
*/

#define IGC_X_VAL_S                      0.3
#define IGC_Y_VAL_S                      0.05

#define IGC_WIDTH_VAL_S                  0.4
#define IGC_HEIGHT_VAL_S                 (0.75 - IGC_HEIGTH_TITLE - IGC_HEIGTH_BUTTON - 2 * IGC_SPACING_Y)

// Classes include
#include "IGC_GUI_classes.hpp"
