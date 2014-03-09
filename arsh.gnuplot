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
set size 1, 1.05
set origin 0.0, -0.05

set border 15
 
set multiplot layout 3,1 title "I-component during takeoff\n"
 
unset title 
set style data boxes
 
set xzeroaxis linewidth 1 linetype 1 linecolor 0
set xrange [5.9:9.4]
 
set timefmt "%S"
 
set ylabel "Angle, radians" offset 2
set ytics 0.1 nomirror
set yrange [-0.15:0.15]
set key bottom right #at 10, 0.35 
set key nobox samplen 1 noenhanced noopaque
set y2tics 15
set y2range [-15:15]
set y2label "Angular velocity, radians/sec" offset -1.85

set arrow from 7.25,-0.15 to 7.25,0.15 nohead ls 6
set label "takeoff" at 7.27,0.13 textcolor lt 1
set arrow from 7.95,-0.15 to 7.95,0.15 nohead ls 6
set label "landing" at 7.97,0.13 textcolor lt 1
plot [:] [:] \
    DATAFILE using 1:6 title "Angle" smooth frequency linestyle 112,\
    DATAFILE using 1:3 title "Angular velocity" smooth frequency linestyle 111 axes x1y2

unset y2tics
unset y2label
unset label

set x2tics in format ""
set x2tics nomirror 0,1,15 scale 0.5
 
unset border
set border 15

#set xtics nomirror
#set xlabel "Time, sec"
unset xtics
unset xlabel
set nokey
set key bottom out horizontal
set key nobox samplen 1 noenhanced noopaque
set ylabel "PID components, %" offset 1,0
set ytics 80
set yrange [-120:120]

set arrow from 7.25,-120 to 7.25,120 nohead ls 6
set arrow from 7.95,-120 to 7.95,120 nohead ls 6
plot [:] [:] \
    DATAFILE using 1:($14/0.01*100) title "P" smooth frequency linestyle 112,\
    DATAFILE using 1:($17/0.02*100) title "I" smooth frequency linestyle 113,\
    DATAFILE using 1:($20/0.03*100) title "D" smooth frequency linestyle 111

unset arrow

set xtics nomirror 6,1,9 scale 0.5
set xlabel "Time, sec" offset 0,1.5
set ylabel "Volts" offset 2
set ytics 5 nomirror
set yrange [10:16]
set key nobox samplen 1 noenhanced noopaque
set y2tics 40 offset -1
set y2range [0:100]
set y2label "Throttle, %" offset -3

set arrow from 7.25,10 to 7.25,16 nohead ls 6
set arrow from 7.95,10 to 7.95,16 nohead ls 6
plot [:] [:] \
    DATAFILE u 1:12 t "Voltage" smooth frequency ls 113,\
    DATAFILE using 1:($11*100) title "Throttle" smooth frequency linestyle 111 axes x1y2
unset multiplot

