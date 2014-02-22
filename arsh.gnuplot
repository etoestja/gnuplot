#!/usr/bin/gnuplot -persist

set term postscript enhanced color portrait size 8,8
set output "./a.eps"

load "./linestyles.gnuplot"

DATAFILE="./quad.dat"
OUTPUT_PIDPNG="/tmp/quad-pid.png"

set tmargin 0
set bmargin 0
set lmargin 7
set rmargin 3
unset xtics
unset ytics
set size 1, 1.15
set origin 0.0, -0.10

set multiplot layout 4,1 title "PID example\n"

set key autotitle column nobox samplen 1 noenhanced noopaque
unset title
set style data boxes

set xzeroaxis
set xrange [0.75:12.75]

set timefmt "%S"

set ylabel "radians" offset 2
set ytics 0.15
set yrange [-0.25:0.25]
set arrow from 2.5,0 to 2.5,10 nohead
plot [:] [:] \
    DATAFILE u 1:9 t "Joystick" smooth frequency ls 112

unset ylabel
set ytics 0.05
set yrange [-0.08:0.08]
plot [:] [:] \
    DATAFILE using 1:6 title "P" smooth frequency linestyle 112,\
    DATAFILE using 1:7 title "I" smooth frequency linestyle 113,\
    DATAFILE using 1:8 title "D" smooth frequency linestyle 111

set ylabel "radians" offset 1
set ytics 0.3
set yrange [-0.5:0.5]
plot [:] [:] \
    DATAFILE using 1:3 title "Angle" smooth frequency linestyle 112

set xtics nomirror
set xlabel "Time, sec"

set ylabel "radians/sec" offset -0.0
set ytics 15
set yrange [-25:25]
plot [:] [:] \
    DATAFILE using 1:2 title "Angular velocity" smooth frequency linestyle 111

unset multiplot
