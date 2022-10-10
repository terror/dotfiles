#!/bin/bash

MKD2HTML=mkd2html
SYNTAX="$2"
EXTENSION="$3"
OUTPUTDIR="$4"
INPUT="$5"
CSSFILE="$6"

[ "$SYNTAX" = "markdown" ] || { echo "Error: Unsupported syntax"; exit 1; };

OUTPUT="$OUTPUTDIR"/$(basename "$INPUT" ."$EXTENSION").html

$MKD2HTML -css "$CSSFILE" "$INPUT"
OUTPUTTMP=$(dirname "$INPUT")/$(basename "$INPUT" ."$EXTENSION").html
mv -f "$OUTPUTTMP" "$OUTPUT"
