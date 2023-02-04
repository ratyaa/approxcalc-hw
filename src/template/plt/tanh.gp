load includedir.'centered.gp'
load includedir.'tex.gp'

outfile = outdir."tanh.svg"
set output outfile

plot tanh(x)
