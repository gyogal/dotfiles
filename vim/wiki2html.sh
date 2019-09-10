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

pandoc -s -f markdown_github -t html -c $CSSFILENAME --metadata pagetitle="$FILENAME" <"$INPUT" >"$OUTPUT.html"
