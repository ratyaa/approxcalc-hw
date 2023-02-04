load includedir.'centered.gp'
load includedir.'tex.gp'

outfile = outdir."sin.svg"
set output outfile

set label yaxis_tag "$\\sin{x}$"

plot sin(x)
