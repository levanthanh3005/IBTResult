
function drawManyGraphSingle() {
	rm drawSingleGraph.gnuplot
	cat <<EOT >> drawSingleGraph.gnuplot
# Scale font and line width (dpi) by changing the size! It will always display stretched.
set terminal png size 1200,800 
set output '$1/type$2-$3.png'
set datafile separator ","


set multiplot layout 2,2        # engage multiplot mode

# Key means label...
set key bottom right
set border 3

set xlabel 'Phase'

set ylabel 'Orchestrator Accuracy' offset 1

plot [:][:] "$1/type$2-$3-0.csv" using 1:4 title 'RLIoT' with lines, \
	"$1/type$2-$3-1.csv" using 1:4 title 'MEC-TI' with lines, \
	"$1/type$2-$3-2.csv" using 1:4 title 'EigenTrust' with lines

set ylabel 'NumOfNode'  offset 1

plot [:][:] "$1/type$2-$3-0.csv" using 1:2 title 'RLIoT' with lines, \
	"$1/type$2-$3-1.csv" using 1:2 title 'MEC-TI' with lines, \
	"$1/type$2-$3-2.csv" using 1:2 title 'EigenTrust' with lines

set ylabel 'MEC Neighbour Accuracy' offset 1

plot [:][:] "$1/type$2-$3-0.csv" using 1:7 title 'RLIoT' with lines, \
 	"$1/type$2-$3-1.csv" using 1:7 title 'MEC-TI' with lines, \
 	"$1/type$2-$3-2.csv" using 1:7 title 'EigenTrust' with lines

set ylabel 'Distance'  offset 1

plot [:][:] "$1/type$2-$3-0.csv" using 1:8 title 'RLIoT' with lines, \
 	"$1/type$2-$3-1.csv" using 1:8 title 'MEC-TI' with lines, \
 	"$1/type$2-$3-2.csv" using 1:8 title 'EigenTrust' with lines

unset multiplot
EOT

docker run -it --rm \
	-v $(pwd):/tmp \
	-w /tmp \
	pavlov99/gnuplot gnuplot drawSingleGraph.gnuplot

}

function drawManyGraphMultiSwarmScore() {
	rm drawSingleGraph.gnuplot

	cat <<EOT >> drawSingleGraph.gnuplot
# Scale font and line width (dpi) by changing the size! It will always display stretched.
set terminal png size 1200,600 
set output '$1/type$2-swarm.png'
set datafile separator ","


set multiplot layout 2,2        # engage multiplot mode

# Key means label...
set key bottom right
set border 3

set ylabel 'Swarm Score'

EOT


	for((distance=1;distance<7;distance+=1)); do 


	cat <<EOT >> drawSingleGraph.gnuplot
set xlabel 'Phase - Distance $distance'

plot [:][:] "$1/type$2-$distance-0.csv" using 1:4 title 'RLIoT' with lines, \
	"$1/type$2-$distance-1.csv" using 1:4 title 'MEC-TI' with lines, \
	"$1/type$2-$distance-2.csv" using 1:4 title 'EigenTrust' with lines

EOT

done


cat <<EOT >> drawSingleGraph.gnuplot
unset multiplot
EOT

docker run -it --rm \
	-v $(pwd):/tmp \
	-w /tmp \
	pavlov99/gnuplot gnuplot drawSingleGraph.gnuplot

}

function drawManyGraphMultiAccuracy() {
	rm drawSingleGraph.gnuplot

	cat <<EOT >> drawSingleGraph.gnuplot
# Scale font and line width (dpi) by changing the size! It will always display stretched.
set terminal png size 1200,600 
set output '$1/type$2-mec.png'
set datafile separator ","


set multiplot layout 2,2        # engage multiplot mode

# Key means label...
set key bottom right
set border 3

set ylabel 'MEC Neighbour Accuracy'

EOT


	for((distance=1;distance<7;distance+=1)); do 


	cat <<EOT >> drawSingleGraph.gnuplot
set xlabel 'Phase - Distance $distance'

plot [:][:] "$1/type$2-$distance-0.csv" using 1:7 title 'RLIoT' with lines, \
	"$1/type$2-$distance-1.csv" using 1:7 title 'MEC-TI' with lines, \
	"$1/type$2-$distance-2.csv" using 1:7 title 'EigenTrust' with lines

EOT

done


cat <<EOT >> drawSingleGraph.gnuplot
unset multiplot
EOT

docker run -it --rm \
	-v $(pwd):/tmp \
	-w /tmp \
	pavlov99/gnuplot gnuplot drawSingleGraph.gnuplot

}


nowdir="1624757865782-5x5"

for((mali=1;mali<3;mali+=1)); do 
	for((distance=1;distance<4;distance+=1)); do 
		drawManyGraphSingle $nowdir $mali $distance
	done

	drawManyGraphMultiSwarmScore $nowdir $mali
	drawManyGraphMultiAccuracy $nowdir $mali

done