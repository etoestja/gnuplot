mpl_top    = 0.4 #inch  outer top margin, title goes here
mpl_bot    = 0.7 #inch  outer bottom margin, x label goes here
mpl_left   = 0.3 #inch  outer left margin, y label goes here
mpl_right  = 0.1 #inch  outer right margin, y2 label goes here
mpl_height = 1.5 #inch  height of individual plots
mpl_width  = 2.0 #inch  width of individual plots
mpl_dx     = 0.1 #inch  inter-plot horizontal spacing
mpl_dy     = 0.3 #inch  inter-plot vertical spacing
mpl_ny     = 4   #number of rows
mpl_nx     = 1   #number of columns

# calculate full dimensions
xsize = mpl_left+mpl_right+(mpl_width*mpl_nx)+(mpl_nx-1)*mpl_dx
ysize = mpl_top+mpl_bot+(mpl_ny*mpl_height)+(mpl_ny-1)*mpl_dy

# placement functions
#   rows are numbered from bottom to top
bot(n) = (mpl_bot+(n-1)*mpl_height+(n-1)*mpl_dy)/ysize
top(n)  = 1-((mpl_top+(mpl_ny-n)*(mpl_height+mpl_dy))/ysize)
#   columns are numbered from left to right
left(n) = (mpl_left+(n-1)*mpl_width+(n-1)*mpl_dx)/xsize
right(n)  = 1-((mpl_right+(mpl_nx-n)*(mpl_width+mpl_dx))/xsize)

set offsets
set autoscale fix
set size 1,1
set autoscale y

set key default

set multiplot layout 4,1 columnsfirst
#set multiplot layout 4,1

set key at screen 0.75, 0.25

set xrange [0.75:12.75]

#set xtics auto
set timefmt "%S"
#unset border
#unset xtics

unset xlabel
set xtics format ""
set xzeroaxis linetype 3 linewidth 2.5

#  set horizontal margins for first column (left)
set lmargin at screen left(1)
set rmargin at screen right(1)

#  set horizontal margins for fourth row (top)
set tmargin at screen top(4)
set bmargin at screen bot(4)

set ylabel "radians"
set ytics 0.15
set yrange [-0.25:0.25]

plot [:] [:] \
    DATAFILE u 1:9 t "Joystick" smooth frequency ls 112

set timefmt "%S"
#  set horizontal margins for first column (left)
set lmargin at screen left(1)
set rmargin at screen right(1)

#  set horizontal margins for fourth row (top)
set tmargin at screen top(3)
set bmargin at screen bot(3)

unset ylabel

set ytics 0.05
set yrange [-0.08:0.08]

plot [:] [:] \
    DATAFILE using 1:6 title "P" smooth frequency linestyle 112,\
    DATAFILE using 1:7 title "I" smooth frequency linestyle 113,\
    DATAFILE using 1:8 title "D" smooth frequency linestyle 111

set timefmt "%S"
#  set horizontal margins for first column (left)
set lmargin at screen left(1)
set rmargin at screen right(1)

#  set horizontal margins for fourth row (top)
set tmargin at screen top(2)
set bmargin at screen bot(2)

set ylabel "radians"

set ytics 0.3
set yrange [-0.5:0.5]

plot [:] [:] \
    DATAFILE using 1:3 title "Angle" smooth frequency linestyle 112

set timefmt "%S"
#  set horizontal margins for first column (left)
set lmargin at screen left(1)
set rmargin at screen right(1)

#  set horizontal margins for fourth row (top)
set tmargin at screen top(1)
set bmargin at screen bot(1)

set ylabel "radians/sec"
set xtics auto
set xlabel "time, seconds"

set xtics format "00:%S"
set ytics 15
set yrange [-25:25]

set key at right(1), 0

plot [:] [:] \
    DATAFILE using 1:2 title "Angular velocity" smooth frequency linestyle 111

unset multiplot
