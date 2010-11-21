/*-----------------------------------------------------------------------------*\
|																				|
|	Kosinski.dll, Enigma.dll, Nemesis.dll, Saxman.dll: Compression and			|
|	Decompression of data in Kosinski, Enimga, Nemesis and Saxman formats		|
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

#ifndef _KENS_H_
#define _KENS_H_

long (__cdecl *KComp)(char *SrcFile, char *DstFile, bool Moduled);
long (__cdecl *KDecomp)(char *SrcFile, char *DstFile, long Pointer, bool Moduled);
long (__cdecl *KCompEx)(char *SrcFile, char *DstFile, long SlideWin, long RecLen, bool Moduled);

long (__cdecl *EComp)(char *SrcFile, char *DstFile, bool Padding);
long (__cdecl *EDecomp)(char *SrcFile, char *DstFile, long Pointer, bool Padding);

long (__cdecl *NComp)(char *SrcFile, char *DstFile);
long (__cdecl *NDecomp)(char *SrcFile, char *DstFile, long Pointer);

long (__cdecl *SComp)(char *SrcFile, char *DstFile, bool WithSize);
long (__cdecl *SDecomp)(char *SrcFile, char *DstFile, long Pointer, unsigned short Size);

bool KInit(char *DLL)
{
	HMODULE hKosinski = LoadLibrary(DLL);
	if (!hKosinski) return false;

	KComp = (long (*)(char *, char *, bool))GetProcAddress(hKosinski, "Comp");
	KDecomp = (long (*)(char *, char *, long, bool))GetProcAddress(hKosinski, "Decomp");
	KCompEx = (long (*)(char *, char *, long, long, bool))GetProcAddress(hKosinski, "CompEx");

	if (KComp==NULL) return false;
	if (KDecomp==NULL) return false;
	if (KCompEx==NULL) return false;

	return true;
}

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

bool NInit(char *DLL)
{
	HMODULE hNemesis = LoadLibrary(DLL);
	if (!hNemesis) return false;

	NComp = (long (*)(char *, char *))GetProcAddress(hNemesis, "Comp");
	NDecomp = (long (*)(char *, char *, long))GetProcAddress(hNemesis, "Decomp");

	if (NComp==NULL) return false;
	if (NDecomp==NULL) return false;

	return true;
}

bool SInit(char *DLL)
{
	HMODULE hSaxman = LoadLibrary(DLL);
	if (!hSaxman) return false;

	SComp = (long (*)(char *, char *, bool))GetProcAddress(hSaxman, "Comp2");
	SDecomp = (long (*)(char *, char *, long, unsigned short))GetProcAddress(hSaxman, "Decomp2");

	if (SComp==NULL) return false;
	if (SDecomp==NULL) return false;

	return true;
}


#endif /* _KENS_H_ */