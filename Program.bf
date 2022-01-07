/*Sigil Beef
Written By Andy P.
Icy Viking Games
Sigil: 0.9.0
Beef: 0.43.0 
Copyright (c) 2022*/

using System;
using System.Interop;
using System.Collections;
using System.Text;


namespace SigilBeef
{
	class Program
	{
		public class Sigil
		{

			//Init Commands
			[Import("sigil.lib"), LinkName("slWindow")]
			public static extern void slWindow(int32 width, int32 height, char8* title, int32 fullScreen);

			[Import("sigil.lib"), LinkName("slShowCursor")]
			public static extern void slshowCursor(int32 showCursor);

			[Import("sigil.lib"), CLink]
			public static extern void slClose();

			[Import("sigil.lib"), LinkName("slShouldClose")]
			public static extern int slShouldClose();

			//Input Functions

			[Import("sigil.lib"), LinkName("slGetKey")]
			public static extern int SlGetKey(int key);

			[Import("sigil.lib"), LinkName("slGetMouseButton")]
			public static extern int slGetMousebutton(int32 button);

			[Import("sigil.lib"), CLink]
			public static extern int slGetMouseX();

			[Import("sigil.lib"), CLink]
			public static extern int slGetMouseY();

			//Time Functions
			[Import("sigil.lib"), CLink]
			public static extern double slGetDeltaTime();

			[Import("sigil.lib"), CLink]
			public static extern double slGetTime();

			//Render Function
			[Import("sigil.lib"), CLink]
			public static extern void slRender();

			//Color Functions
			[Import("sigil.lib"), CLink]
			public static extern void slSetBackColor(double r,double g,double b);

			[Import("sigil.lib"), CLink]
			public static extern void slSetForeColor(double r,double g,double b,double a);

			//Blend Function
			[Import("sigil.lib"), CLink]
			public static extern void slSetAdditiveBlend(int32 ab);

			//Transformation Functions
			[Import("sigil.lib"), CLink]
			public static extern void slPush();

			[Import("sigil.lib"), CLink]
			public static extern void slPop();

			[Import("sigil.lib"), CLink]
			public static extern void slTranslate(double x,double y);

			[Import("sigil.lib"), CLink]
			public static extern void slRotate(double degrees);

			[Import("sigil.lib"), CLink]
			public static extern void slScale(double x,double y);

			//Load Texture
			[Import("sigil.lib"), CLink, LinkName("slLoadTexture")]
			public static extern void slLoadTexture(char8* file);

			//Sound Functions
			[Import("sigil.lib"), CLink, LinkName("sloLoadWAV")]
			public static extern int slLoadWAV(char8* file);

			[Import("sigil.lib"), CLink]
			public static extern int slSoundPlay(int32 sound);

			[Import("sigil.lib"), CLink]
			public static extern int slSoundLoop(int32 sound);

			[Import("sigil.lib"), CLink]
			public static extern void slSoundPause(int32 sound);

			[Import("sigil.lib"), CLink]
			public static extern void slSoundStop(int32 sound);

			[Import("sigil.lib"), CLink]
			public static extern void slSoundPauseAll();

			[Import("sigil.lib"), CLink]
			public static extern void slSoundResumeAll();

			[Import("sigil.lib"), CLink]
			public static extern void slSoundStopAll();

			[Import("sigil.lib"), CLink]
			public static extern int slSoundPlaying(int32 sound);

			[Import("sigil.lib"), CLink]
			public static extern int slSoundLooping(int32 sound);

			//Shape Functions
			[Import("sigil.lib"), CLink]
			public static extern void slTriangleFill(double x,double y,double w,double h);

			[Import("sigil.lib"), CLink]
			public static extern void slTriangleOutline(double x,double y,double w,double h);

			[Import("sigil.lib"), CLink]
			public static extern void slRectangleFill(double x,double y,double w,double h);

			[Import("sigil.lib"), CLink]
			public static extern void slRectangleOutline(double x,double y,double w,double h);

			[Import("sigil.lib"), CLink]
			public static extern void slCircleFill(double x,double y,double rad, int32 numVerts);

			[Import("sigil.lib"), CLink]
			public static extern void slCircleOutline(double x,double y,double rad,int32 numVerts);

			[Import("sigil.lib"), CLink]
			public static extern void slSemiCircleFill(double x,double y,double rad, int32 numVerts, double deg);

			[Import("sigil.lib"), CLink]
			public static extern void slSemiCircleOutline(double x,double y,double rad,int32 numVerts,double deg);

			[Import("sigil.lib"), CLink]
			public static extern void slPoint(double x,double y);

			[Import("sigil.lib"), CLink]
			public static extern void slLine(double x1,double y1, double x2,double y2);

			[Import("sigil.lib"), CLink]
			public static extern void slSetSpriteTiling(double x,double y);

			[Import("sigil.lib"), CLink]
			public static extern void slSetSpriteScroll(double x,double y);

			[Import("sigil.lib"), CLink]
			public static extern void slSprite(int32 tex, double x,double y,double w,double h);

			//Text Functions
			[Import("sigil.lib"), CLink]
			public static extern void slSetTextAlign(int32 align);

			[Import("sigil.lib"), CLink]
			public static extern double slGetTextWidth(char8* text);

			[Import("sigil.lib"), CLink]
			public static extern void slGetTextHeight(char8* text);

			[Import("sigil.lib"), CLink, LinkName("slLoadFont")]
			public static extern int slLoadFont(char8* file);

			[Import("sigil.lib"), CLink]
			public static extern void slSetFont(int32 font,int32 size);

			[Import("sigil.lib"), CLink]
			public static extern void slSetFontSize(int32 size);

			[Import("sigil.lib"), CLink]
			public static extern void slText(double x,double y,char8* text);
		}
		
		public static int Main(String[] args)
		{
			
			Sigil.slWindow(800,600,"Hello",Flags.SL_FALSE);

			while(Sigil.slShouldClose() == 0)
			{
				if(Sigil.SlGetKey(Flags.SL_KEY_ESCAPE) == 1)
				{
					Sigil.slClose();
				}

				Sigil.slRender();
			}

			Sigil.slClose();

			return 0;
		}
	}
}
