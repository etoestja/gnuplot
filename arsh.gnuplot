#!/usr/bin/gnuplot -persist
 
set term postscript enhanced color portrait size 8,8 solid
set output "./a.eps"
 
#set term tikz standalone solid fontscale 1 size 20cm, 15cm
#set output "/tmp/arsh.tex"
 
load "./linestyles.gnuplot"
 
DATAFILE="./quad.dat"
 
#set grid
 
set tmargin 0
set bmargin 0
set lmargin 7
set rmargin 3
unset xtics
unset ytics
set size 1, 1.15
set origin 0.0, -0.10
 
set multiplot layout 2,1 title "PID example\n"
 
unset title
set style data boxes
 
set xzeroaxis
set xrange [0.75:12.75]
 
set timefmt "%S"
 
set ylabel "radians" offset 2
set ytics 0.3
set yrange [-0.5:0.5]
#set arrow from 2.5,0 to 2.5,10 nohead
set key bottom right #at 10, 0.35 
set key nobox samplen 1 noenhanced noopaque
plot [:] [:] \
    DATAFILE u 1:9 t "Joystick" smooth frequency ls 111,\
    DATAFILE using 1:3 title "Angle" smooth frequency linestyle 112,\
    DATAFILE using 1:($2/100) title "Angular velocity" smooth frequency linestyle 113
 
 
set xtics nomirror
set xlabel "Time, sec"
set nokey
set key bottom out horizontal
set key nobox samplen 1 noenhanced noopaque
unset ylabel
set ytics 0.05
set yrange [-0.08:0.08]
plot [:] [:] \
    DATAFILE using 1:6 title "P" smooth frequency linestyle 112,\
    DATAFILE using 1:7 title "I" smooth frequency linestyle 113,\
    DATAFILE using 1:8 title "D" smooth frequency linestyle 111
 
 
#set ylabel "radians/sec" offset -0.0
#set ytics 15
#set yrange [-25:25]
#plot [:] [:] \
 
unset multiplot
