load includedir.'centered.gp'
load includedir.'tex.gp'

outfile = outdir."linexp.svg"
set output outfile

set xrange [0:1e-8]
set yrange [0:1e-8]

set xtics add ("0" 0)
set ytics add ("0" 0)

plot exp(-20*(x+1)), x lt 3
