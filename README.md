# SigilBeef
Wrapper of Sigil for Beef

#ABOUT

This is a wrapper of the Sigil library for the Beef programming language. You can use Sigil to create small games and for rapid prototyping. 

#LICENSE

This software is provided as-is. There is no warranty for this software. You use this software at your own risk. You may not hold the author(s) responsible for anything that may occur when using this software. You may use this software to write your own programs and distribute them as you please. You may not claim you wrote the original wrapper. 

#EXAMPLE
```beef
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
```

