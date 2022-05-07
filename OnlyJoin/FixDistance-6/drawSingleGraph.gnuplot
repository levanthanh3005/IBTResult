# Scale font and line width (dpi) by changing the size! It will always display stretched.
set terminal png size 1200,600 
set output '1624757865782-5x5/type2-mec.png'
set datafile separator ","


set multiplot layout 2,2        # engage multiplot mode

# Key means label...
set key bottom right
set border 3

set ylabel 'MEC Neighbour Accuracy'

set xlabel 'Phase - Distance 1'

plot [:][:] "1624757865782-5x5/type2-1-0.csv" using 1:7 title 'RLIoT' with lines, 	"1624757865782-5x5/type2-1-1.csv" using 1:7 title 'MEC-TI' with lines, 	"1624757865782-5x5/type2-1-2.csv" using 1:7 title 'EigenTrust' with lines

set xlabel 'Phase - Distance 2'

plot [:][:] "1624757865782-5x5/type2-2-0.csv" using 1:7 title 'RLIoT' with lines, 	"1624757865782-5x5/type2-2-1.csv" using 1:7 title 'MEC-TI' with lines, 	"1624757865782-5x5/type2-2-2.csv" using 1:7 title 'EigenTrust' with lines

set xlabel 'Phase - Distance 3'

plot [:][:] "1624757865782-5x5/type2-3-0.csv" using 1:7 title 'RLIoT' with lines, 	"1624757865782-5x5/type2-3-1.csv" using 1:7 title 'MEC-TI' with lines, 	"1624757865782-5x5/type2-3-2.csv" using 1:7 title 'EigenTrust' with lines

set xlabel 'Phase - Distance 4'

plot [:][:] "1624757865782-5x5/type2-4-0.csv" using 1:7 title 'RLIoT' with lines, 	"1624757865782-5x5/type2-4-1.csv" using 1:7 title 'MEC-TI' with lines, 	"1624757865782-5x5/type2-4-2.csv" using 1:7 title 'EigenTrust' with lines

set xlabel 'Phase - Distance 5'

plot [:][:] "1624757865782-5x5/type2-5-0.csv" using 1:7 title 'RLIoT' with lines, 	"1624757865782-5x5/type2-5-1.csv" using 1:7 title 'MEC-TI' with lines, 	"1624757865782-5x5/type2-5-2.csv" using 1:7 title 'EigenTrust' with lines

set xlabel 'Phase - Distance 6'

plot [:][:] "1624757865782-5x5/type2-6-0.csv" using 1:7 title 'RLIoT' with lines, 	"1624757865782-5x5/type2-6-1.csv" using 1:7 title 'MEC-TI' with lines, 	"1624757865782-5x5/type2-6-2.csv" using 1:7 title 'EigenTrust' with lines

unset multiplot
