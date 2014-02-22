#!/usr/bin/gnuplot -persist

set term postscript enhanced color portrait size 10,10
set output "./a.eps"

load "./linestyles.gnuplot"

DATAFILE="./quad.dat"
OUTPUT_PIDPNG="/tmp/quad-pid.png"

#set xlabel "t"
# horizontal nobox title "PID data"
#set key top left
#set key outside
#set key reverse
#set key width 10
#set key height 5
#set key font ",14"
#set key spacing 4
#set key box 1

set xdata time # Alternatively, unset xtics will work

load "./quad-plots.gnuplot"
