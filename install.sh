#!/bin/bash

#
# Use this script for deploying this texmf structure to your local texmf
# location.
#

TEXMF="$HOME/texmf/" # change this to your user texmf dir
LATEX="tex/latex/fykosx" # path to store fykosx macros
GEOMETRY="tex/latex/geometry" # path to store fykosx macros
MPOST="metapost/fykos" # path to metapost macros
FONTS="fonts/truetype/fykos" # path to custom fonts

if [ -d "$TEXMF$LATEX" -a "$1" != "-f" ] ; then
	echo "Macros 'fykosx' already installed. Use -f to reinstall."
	exit 1
fi

# preapre directories
rm -rf "$TEXMF$LATEX"
rm -rf "$TEXMF$MPOST"
rm -rf "$TEXMF$GEOMETRY"
rm -rf "$TEXMF$FONTS"

mkdir -p "$TEXMF$LATEX"
mkdir -p "$TEXMF$MPOST"
mkdir -p "$TEXMF$GEOMETRY"
mkdir -p "$TEXMF$FONTS"

# copy files
cp -r "./$LATEX" "$TEXMF$LATEX"
cp -r "./$MPOST" "$TEXMF$MPOST"
cp -r "./$GEOMETRY" "$TEXMF$GEOMETRY"
cp -r "./$FONTS" "$TEXMF$FONTS"

# update kpathsearch
mktexlsr ${TEXMF:0:-1}
