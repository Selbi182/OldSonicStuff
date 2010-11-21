==============================================================================
PlaneEd - Sega Genesis/MegaDrive plane mappings editor
==============================================================================
written by qiuu, with the use of:
	SDL (Simple Direct Media Layer)
	KENS library (Genesis compression formats) code, slightly modified
	Kid Chameleon decompression code by saxman, slightly modified
------------------------------------------------------------------------------


Table of Contents

1	Introduction
2	Usage
3	Project files
4	Controls
5	Acknowledgements

------------------------------------------------------------------------------


-------------------
1. Introduction
-------------------

PlaneEd is an application for editing plane mappings in the Sega Genesis/Megadrive format.
It supports uncompressed mappings and the commonly used Enigma compression.

For editing of a plane, in addition art and palette files in the Genesis format are required, whereas the former my be compressed.
To have the program work, project files with the required data will have to be passed to it.
For more details on to how, see the next paragraph.


-------------------
2. Usage
-------------------

In order to edit mappings with PlaneEd, various information on the data to be worked with needs to be passed to the program.
In order to allow PlaneEd process this data, project files containing the necessary information are needed to be set up for every mapping to be edited.
The name of the project file is then to be passed to the program via commandline, e.g.

	PlaneEd projectfile.ext

If no project filename is passed to the program, it will terminate instantly.
The format of the project files is described in the paragraph below.

Please note that PlaneEd will terminate instantly if the information specified by the user is cannot be processed properly.
This includes, but is not limited to: specifying non-existent files, wrong compression formats, wrong offsets, too large plane sizes.

After termination, "stderr.txt" might contain information on what caused the program to terminate.
In addition, "tempmap.bin"/"tempart.bin"/"temppal.bin" containing decompressed mapping/art/palette data might remain if the program terminated during loading process.


-------------------
3. Project files
-------------------

Each line of a project file contains first what type of information this line contains, followed by the information itself.

It is strongly recommended to view the example project files for better understanding:
LevelSelect.txt:	to be placed in the root folder of the Sonic 2 disassembly (as of Apr. 2009)
MapSega.txt:	same as above
KidCard.txt:	to be placed in the same folder as a Kid Chameleon rom called "kid.bin"
Savestate.txt:	To be placed in the same folder as an in-level savestate of a Sonic 1 or 2 rom/hack called "Savestate.gs0"

Further files can be found here: http://207.58.177.175/~geoo89/PlaneEd/PrjFiles/

Below is a list of parameters of information types the program reads.
The information must be specified after the colon, to be either a sequence of characters (string), or a number (decimal or with '0x' prefix hexadecimal).

Palette File:	palette file to load
Mapping File:	plane mapping file to load
Art File:	art file to load
Palette Offset:	offset in file to load palette from
Mapping Offset:	offset in file to load mapping from
Art Offset:	offset in file to load art from
Palette Length:	size of palette (not needed to be specified if file contains only palette)
Mapping Length:	size of mapping (only to be specified if mapping is uncompressed and not the only content in file)
Art Length:	size of art (only to be specified if mapping is uncompressed and not the only content in file)
Mapping Compression:	Mapping compression type, either "None" or "Enigma"
Art Compression:	Art compression type*
x-Size:		horizontal size of map in tiles
y-Size:		vertical size of map in tiles
Tile Offset:	amount of tiles the tile IDs of non-empty tiles in mapping file are offset compared to the tiles in art file; default is 0
		more precise information on this attribute can be found here: http://forums.sonicretro.org/index.php?s=&showtopic=15039&view=findpost&p=303925
Letter Offset:	offset (in tiles) of the tiles containing art for letters (if any)
Number Offset:	offset (in tiles) of the tiles containing art for numbers (if any)
Save File:	File to save mappings to. If not specified, mapping will be saved to where it was loaded from.
		If mapping was not loaded as single file, and "Save File:" is not specified, file will be saved to MapDefault.bin

*) Art compression types:
	"None"
	"Enigma"
	"Kosinski"
	"Nemesis"
	"Kid Chameleon"


-------------------
4. Controls
-------------------

Note: Cursor refers to the tile with a rectangle around it, while mouse cursor to the position of the mouse.
Selected tile is the tile data that is currently stored to be placed upon a click or pressing Enter.

Left Click:
	On map: Place currently selected tile to position of mouse cursor
	On selector: Select tile under mouse cursor
Right Click:
	On map: Select tile under mouse cursor
	On selector: Select tile under mouse cursor

Enter	Place currently selected tile to position of cursor
# or \	Select tile under cursor

F1-F4	Change palette line of tile under cursor (and of selector viewer)
- or /	Toggle the priority of tile under cursor between high and low
,	Flip tile under cursor horizontally
.	Flip tile under cursor vertically
PgUp	Decrease ID of currently selected tile
PgDown	Increase ID of currently selected tile

Del	Clear tile under cursor
Backsp	Move cursor to the left and clear that tile
Space	Clear tile and move cursor to the right
Arrows	Change position of tile under cursor
a-z,0-9	Write text/tiles (if tile set contains letters/number and offset has been specified)

ESC	Terminate the program without saving
F9	Save Map
F10	Refresh screen

F5	Toggle whether to view high priority tiles
F6	Toggle whether to view low priority tiles


-------------------
5. Acknowledgements
-------------------

Thanks to:
	- The KENS library authors: for making KENS available
	- Damian Grove: for the documentation and code of the Kid Chameleon compression format
	- Puto: for consulting on license issues and trying to run it under Mac OS (which sadly failed)
	- the #boom crew: for beta-testing