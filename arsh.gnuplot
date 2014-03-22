#!/usr/bin/gnuplot -persist
 
set term postscript enhanced color portrait size 8,4 solid
set output "./a.eps"

#set term tikz standalone solid fontscale 1 size 20cm, 15cm
#set output "./arsh.tex"
 
load "./linestyles.gnuplot"
 
DATAFILE="./quad.dat"
 
#set grid
 
set tmargin 0
set bmargin 0
set lmargin 7
set rmargin 5
unset xtics
unset ytics
set size 1, 1.05
set origin 0.0, -0.05

set border 15
set xtics nomirror 1,1,12 scale 0.5 offset -0.2,2
set xlabel "Time, sec" offset 0, 1.97

set multiplot layout 1,1 title "D equation comparison\n"
 
unset title 
set style data boxes
 
set xzeroaxis linewidth 1 linetype 1 linecolor 0
set xrange [0:13.3]
 
set timefmt "%S"
 
set ylabel "Angle, radians" offset 2
set ytics 1 nomirror
set yrange [-1.5:1.5]
set key top right #at 10, 0.35 
set key nobox samplen 1 noenhanced noopaque

plot [:] [:] \
    DATAFILE u 1:2 t "Joystick" smooth frequency ls 113,\
    DATAFILE using 1:3 title "D = e0 - e" smooth frequency linestyle 112,\
    DATAFILE using 1:4 title "D = v0 - v" smooth frequency linestyle 111

