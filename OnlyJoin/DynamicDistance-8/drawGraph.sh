function drawManyGraphSingleFull() {
	rm drawSingleGraph.gnuplot
	cat <<EOT >> drawSingleGraph.gnuplot
# Scale font and line width (dpi) by changing the size! It will always display stretched.
set terminal png size 1000,1000 
set output '$1/type$2-Full.png'
set datafile separator ","


set multiplot layout 3,2        # engage multiplot mode

# Key means label...
set key bottom right
set border 3

set xlabel 'Phase'

set ylabel 'Orchestrator Accuracy'

plot [:][:] "$1/type$2-0.csv" using 1:4 title 'RLIoT' with lines, \
	"$1/type$2-1.csv" using 1:4 title 'MEC-TI' with lines, \
	"$1/type$2-2.csv" using 1:4 title 'EigenTrust' with lines

set ylabel 'MEC Neighbour Accuracy'

plot [:][:] "$1/type$2-0.csv" using 1:7 title 'RLIoT' with lines, \
 	"$1/type$2-1.csv" using 1:7 title 'MEC-TI' with lines, \
 	"$1/type$2-2.csv" using 1:7 title 'EigenTrust' with lines

set ylabel 'Num Of Node'

plot [:][:] "$1/type$2-0.csv" using 1:2 title 'RLIoT' with lines, \
	"$1/type$2-1.csv" using 1:2 title 'MEC-TI' with lines, \
	"$1/type$2-2.csv" using 1:2 title 'EigenTrust' with lines

set ylabel 'Num of Communication'

plot [:][:] "$1/type$2-0.csv" using 1:10 title 'RLIoT' with lines, \
 	"$1/type$2-1.csv" using 1:10 title 'MEC-TI' with lines, \
 	"$1/type$2-2.csv" using 1:10 title 'EigenTrust' with lines

set ylabel 'Distance'

plot [:][:] "$1/type$2-0.csv" using 1:8 title 'RLIoT' with lines, \
 	"$1/type$2-1.csv" using 1:8 title 'MEC-TI' with lines, \
 	"$1/type$2-2.csv" using 1:8 title 'EigenTrust' with lines


unset multiplot
EOT

docker run -it --rm \
	-v $(pwd):/tmp \
	-w /tmp \
	pavlov99/gnuplot gnuplot drawSingleGraph.gnuplot

}

function drawManyGraphSingleShort() {
	rm drawSingleGraph.gnuplot
	cat <<EOT >> drawSingleGraph.gnuplot
# Scale font and line width (dpi) by changing the size! It will always display stretched.
set terminal png size 1300,300 
set output '$1/type$2-Short.png'
set datafile separator ","


set multiplot layout 1,3        # engage multiplot mode

# Key means label...
set key bottom right
set border 1

set lmargin 6
set rmargin 2
#set tmargin 1
#set bmargin 2

set xlabel 'Phase' offset 1

set ylabel 'Orchestrator Accuracy' offset 2

plot [:][:] "$1/type$2-0.csv" using 1:4 title 'RLIoT' with lines, \
	"$1/type$2-1.csv" using 1:4 title 'MEC-TI' with lines, \
	"$1/type$2-2.csv" using 1:4 title 'EigenTrust' with lines

set ylabel 'MEC Neighbour Accuracy' offset 2

plot [:][:] "$1/type$2-0.csv" using 1:7 title 'RLIoT' with lines, \
 	"$1/type$2-1.csv" using 1:7 title 'MEC-TI' with lines, \
 	"$1/type$2-2.csv" using 1:7 title 'EigenTrust' with lines

#set ylabel 'Num Of Node' offset 2

#plot [:][:] "$1/type$2-0.csv" using 1:2 title 'RLIoT' with lines, \
#	"$1/type$2-1.csv" using 1:2 title 'MEC-TI' with lines, \
#	"$1/type$2-2.csv" using 1:2 title 'EigenTrust' with lines

set ylabel 'Num of Communication' offset 2

plot [:][:] "$1/type$2-0.csv" using 1:10 title 'RLIoT' with lines, \
 	"$1/type$2-1.csv" using 1:10 title 'MEC-TI' with lines, \
 	"$1/type$2-2.csv" using 1:10 title 'EigenTrust' with lines

#set ylabel 'Distance' offset 2

#plot [:][:] "$1/type$2-0.csv" using 1:8 title 'RLIoT' with lines, \
# 	"$1/type$2-1.csv" using 1:8 title 'MEC-TI' with lines, \
# 	"$1/type$2-2.csv" using 1:8 title 'EigenTrust' with lines

unset multiplot
EOT

docker run -it --rm \
	-v $(pwd):/tmp \
	-w /tmp \
	pavlov99/gnuplot gnuplot drawSingleGraph.gnuplot

}

drawManyGraphSingleFull 1624301525742-5x5 1
drawManyGraphSingleFull 1624301525742-5x5 2

drawManyGraphSingleShort 1624301525742-5x5 1
drawManyGraphSingleShort 1624301525742-5x5 2