#!/bin/bash

FORCE="$1"
SYNTAX="$2"
EXTENSION="$3"
OUTPUTDIR="$4"
INPUT="$5"
CSSFILE="$6"

FILE=$(basename "$INPUT")
FILENAME=$(basename "$INPUT" .$EXTENSION)
FILEPATH=${INPUT%$FILE}
OUTDIR=${OUTPUTDIR%$FILEPATH*}
OUTPUT="$OUTDIR"/$FILENAME
CSSFILENAME=$(basename "$6")
SCRIPTDIR=$(dirname "$0")

cp "$SCRIPTDIR/wiki2html.css" "$CSSFILE"

# If GNU sed is installed (OSX Homebrew), use that instead of default sed
SED="gsed"
type "$SED" &>/dev/null || SED="sed"

"$SED" -r 's/(\[.+\])\(([^#)]+)\)/\1(\2.html)/g' <"$INPUT" | pandoc -s -f $SYNTAX -t html -c $CSSFILENAME --metadata pagetitle="$FILENAME"| "$SED" -r 's/<li>(.*)\[ \]/<li class="todo done0">\1/g; s/<li>(.*)\[X\]/<li class="todo done4">\1/g' > "$OUTPUT.html"

