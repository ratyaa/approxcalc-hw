load includedir.'unset.gp'

set grid xtics ytics lt 0 lw 0.5 linecolor rgb GRIDCOLOR
set border lw 0.7

set xtics axis scale 0.5,0.3 offset -0.5,0.2
set ytics axis scale 0.5,0.3 offset -0.5

set xtics add ("" 0)
set ytics add ("" 0)

xaxis_tag = 100
yaxis_tag = 200

set xrange [-1:1]
set yrange [-1:1]

set arrow xaxis_tag from graph 0, first 0 to graph 1.04, first 0 size graph 0.02,15,60 filled ls -1 lw 0.7
set arrow yaxis_tag from first 0, graph 0 to first 0, graph 1.04 size graph 0.02,15,60 filled ls -1 lw 0.7

set label xaxis_tag "$x$" at graph 1.02, first 0 offset 1.5,0.6 right
set label yaxis_tag "$f(x)$" at first 0, graph 1.02 offset 5,0.2 right
