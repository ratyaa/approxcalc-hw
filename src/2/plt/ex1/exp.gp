load includedir.'centered.gp'
load includedir.'tex.gp'

outfile = outdir."exp.svg"
set output outfile

set xrange [-4:4]
set yrange [0:100]

set xtics add ("0" 0)
set ytics add ("0" 0)

set label yaxis_tag "$e^x$"

plot exp(x)
