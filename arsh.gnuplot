#!/usr/bin/gnuplot -persist
 
set term postscript enhanced color portrait size 8,8 solid
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
set size 1, 1.15
set origin 0.0, -0.10

set border 3
set xtics nomirror 0,1,15 scale 0.5
set xlabel "Time, sec"
 
set multiplot layout 2,1 title "PID example\n"
 
unset title 
set style data boxes
 
set xzeroaxis linewidth 1 linetype 1 linecolor 0
set xrange [0.75:12.75]
 
set timefmt "%S"
 
set ylabel "radians" offset 2
set ytics 0.3 nomirror
set yrange [-0.5:0.5]
#set arrow from 2.5,0 to 2.5,10 nohead
set key bottom right #at 10, 0.35 
set key nobox samplen 1 noenhanced noopaque

plot [:] [:] \
    DATAFILE u 1:9 t "Joystick" smooth frequency ls 113,\
    DATAFILE using 1:3 title "Angle" smooth frequency linestyle 112


unset y2tics
unset y2label

set x2tics in format ""
set x2tics nomirror 0,1,15 scale 0.5
 
unset border
set border 6

#set xtics nomirror
#set xlabel "Time, sec"
unset xtics
unset xlabel
set nokey
set key bottom out horizontal
set key nobox samplen 1 noenhanced noopaque
set ylabel "%"
set ytics 80
set yrange [-100:100]
plot [:] [:] \
    DATAFILE using 1:($6/0.05694*100) title "P" smooth frequency linestyle 112,\
    DATAFILE using 1:($7/0.0364*100) title "I" smooth frequency linestyle 113,\
    DATAFILE using 1:($8/0.0736*100) title "D" smooth frequency linestyle 111
 
unset multiplot
