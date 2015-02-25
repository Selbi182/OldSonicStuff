=========================================================================================
	About HivePal Beta v0.2
=========================================================================================

Written by Hivebrain, HivePal is a palette editor for Megadrive games. This is a beta
version, so any damage caused by the program to your ROMs is not my fault.

Some games are supported by palette script files, although you can open and edit any *.bin
file. If you have any suggestions or bug reports, email me at leonwhite1@gmail.com.


Release Notes For v0.2:
----------------------
* Added palette browser.
* Added ability for user to add support for more games.
* Added copy/paste feature.
* Fixed a bug in the 512-colour menu.


=========================================================================================
	Usage
=========================================================================================

 ----------------------------------------------
 |  -----------------------   --------------  |
 | |                       | |              | |
 | | (1)                   | | (4)          | |
 | |                       | |              | |
 | |                       | |              | |
 |  -----------------------  |              | |
 |  ---------------   -----  |              | |
 | | (2)           | | (3) | |              | |
 | |               | |     | |              | |
 |  ---------------   -----   --------------  |
 | Length  Address   (Load)(Get)(Save)(Browse)|
 ----------------------------------------------

1. Palette menu. This appears when a palette has been loaded.
2. Palette bars. Click on these to change the red/green/blue values of the selected colour.
3. Current colour. Click on this to bring up a new menu showing all 512 Megadrive colours.
4. Palette list. Use this for editing supported games. If you select a palette from the
   list without saving a previously edited palette, you will lose your work. Be sure to
   save after every palette you edit.

Length   The number of colours in the palette (that's colours, not bytes!). This cannot
         exceed $40.

Address  Hex address of the palette in the ROM.


Copying & Pasting Pallets:
-------------------------
* Right-click a colour to copy all colours between it and the current colour (inclusive),
  with a maximum of 16 colours.
* You can see which colours have been copied in the top left-hand corner of the window.
* To paste the colours, double-click on the colour you want to overwrite.
* This may be confusing at first, but you will find it quicker than using the keyboard.


=========================================================================================
	Acknowledgements
=========================================================================================

Korama - for all the help and improvements to the program.
ICEknight & Tweaker - for suggesting new features.
Esrael L. G. Neto - for ESE data files which were adapted for use in HivePal.


=========================================================================================
	Known Bugs
=========================================================================================

* ROMs occasionally fail to load.
* The program can't distinguish between Sonic 1 and Sonic 2 Beta, due to the games having
  the same serial number.