#!/usr/bin/env bash

# move to ./static/ for convenience
cd ./static/

# glob all of the files into an array
shopt -s nullglob
colorsArr=(./_styl/_colors/*)

# generate new CSS file for each color
for i in ./_styl/_colors/*; do
  colorName=$(basename $i .styl)
  stylusArg="""{\"\$colors\": \"${colorName}\"}"""
  stylus --use ./_styl/_variables.js --with "$stylusArg" ./_styl/style.styl -o ./css/style-${colorName}.css
done

