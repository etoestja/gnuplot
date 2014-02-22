#!/usr/bin/gnuplot -persist
 
#set term postscript enhanced color portrait size 8,8 solid
#set output "./a.eps"
 
set term tikz standalone solid #fontscale 1 #size 20cm, 15cm
set output "/tmp/arsh.tex"
 
load "~/sandbox/linestyles.gnuplot"
 
DATAFILE="./quad.dat"
 
XMIN=0
XMAX=12
 
tf(x) = x - 0.75
 
#set grid
 
set tmargin 0
set bmargin 0
set lmargin 7
set rmargin 3
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
 
set ytics nomirror
set ylabel "radians" offset 2
set ytics ("yoba" -0.5)
set yrange [-0.7:0.7]
#set arrow from 2.5,0 to 2.5,10 nohead
set key bottom right #at 10, 0.35 
set key nobox samplen 1 noenhanced noopaque
plot [XMIN:XMAX] [:] \
    DATAFILE u (tf($1)):9 t "Joystick" smooth frequency ls 111,\
    DATAFILE using (tf($1)):3 title "Angle" smooth frequency linestyle 112,\
    DATAFILE using (tf($1)):($2/100) title "Angular velocity" smooth frequency linestyle 113
 
unset border
set border 6
 
set x2tics in format ""
set x2tics nomirror 0,1,15 scale 0.5
 
 
set nokey
set key bottom out horizontal
set key nobox samplen 1 noenhanced noopaque
unset ylabel
unset xtics
unset xlabel
set ytics 0.05
set yrange [-0.08:0.08]
plot [XMIN:XMAX] [:] \
    DATAFILE using (tf($1)):6 title "P" smooth frequency linestyle 112,\
    DATAFILE using (tf($1)):7 title "I" smooth frequency linestyle 113,\
    DATAFILE using (tf($1)):8 title "D" smooth frequency linestyle 111
 
 
#set ylabel "radians/sec" offset -0.0
#set ytics 15
#set yrange [-25:25]
#plot [:] [:] \
 
unset multiplot
