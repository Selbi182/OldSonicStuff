/*-----------------------------------------------------------------------------*\
|																				|
|	Enigma.dll: Compression / Decompression of data in Enigma format			|
|	Copyright © 2002-2004 The KENS Project Development Team						|
|																				|
|	This library is free software; you can redistribute it and/or				|
|	modify it under the terms of the GNU Lesser General Public					|
|	License as published by the Free Software Foundation; either				|
|	version 2.1 of the License, or (at your option) any later version.			|
|																				|
|	This library is distributed in the hope that it will be useful,				|
|	but WITHOUT ANY WARRANTY; without even the implied warranty of				|
|	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU			|
|	Lesser General Public License for more details.								|
|																				|
|	You should have received a copy of the GNU Lesser General Public			|
|	License along with this library; if not, write to the Free Software			|
|	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA	|
|																				|
\*-----------------------------------------------------------------------------*/

#ifndef _ENIGMA_H_
#define _ENIGMA_H_

long (__cdecl *EComp)(char *SrcFile, char *DstFile, bool Padding);
long (__cdecl *EDecomp)(char *SrcFile, char *DstFile, long Pointer, bool Padding);

bool EInit(char *DLL)
{
	HMODULE hEnigma = LoadLibrary(DLL);
	if (!hEnigma) return false;

	EComp = (long (*)(char *, char *, bool))GetProcAddress(hEnigma, "Comp");
	EDecomp = (long (*)(char *, char *, long, bool))GetProcAddress(hEnigma, "Decomp");

	if (EComp==NULL) return false;
	if (EDecomp==NULL) return false;

	return true;
}


#endif /* _ENIGMA_H_ */