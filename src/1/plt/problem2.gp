load includedir.'centered.gp'
load includedir.'tex.gp'

outfile = outdir."problem2.svg"
set output outfile

set xtics ("" 0, "$\\pi$" pi, "$2\\pi$" 2*pi, "$3\\pi$" 3*pi, "$4\\pi$" 4*pi)

set xrange [0:4*pi]
set yrange [-2:2]

set key right bottom
set key width -8

plot cos(x) title "$\\cos{x}$",\
     sin(x)/x title "$\\sinc{x}$",\
     abs(cos(x) + 3*sin(x)/x) title "$|\\cos{x} + 3\\sinc{x}|$"

