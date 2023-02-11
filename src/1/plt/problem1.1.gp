load includedir.'centered.gp'
load includedir.'tex.gp'

outfile = outdir."problem1.1.svg"
set output outfile

set xrange [-4:4]
set yrange [-1.5:1.5]

set key right bottom
set key width -11

plot tanh(2*x) title "$\\tanh{2x}$",\
     tanh(x) title "$\\tanh{x}$",\
     tanh(0.5*x) title "$\\tanh{\\frac12 x}$",\
     atan(x) title "$\\arctan{x}$"
