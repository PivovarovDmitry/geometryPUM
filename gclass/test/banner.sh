#!/bin/bash

convert $1 -background white -gravity center -extent 600x200 -channel RGB -negate test.png
#convert test.png -background black -gravity east -extent 800x200 $1
#rm test.png
