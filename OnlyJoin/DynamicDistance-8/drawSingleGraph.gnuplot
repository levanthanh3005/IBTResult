# Scale font and line width (dpi) by changing the size! It will always display stretched.
set terminal png size 1300,300 
set output '1624301525742-5x5/type2-Short.png'
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

plot [:][:] "1624301525742-5x5/type2-0.csv" using 1:4 title 'RLIoT' with lines, 	"1624301525742-5x5/type2-1.csv" using 1:4 title 'MEC-TI' with lines, 	"1624301525742-5x5/type2-2.csv" using 1:4 title 'EigenTrust' with lines

set ylabel 'MEC Neighbour Accuracy' offset 2

plot [:][:] "1624301525742-5x5/type2-0.csv" using 1:7 title 'RLIoT' with lines,  	"1624301525742-5x5/type2-1.csv" using 1:7 title 'MEC-TI' with lines,  	"1624301525742-5x5/type2-2.csv" using 1:7 title 'EigenTrust' with lines

#set ylabel 'Num Of Node' offset 2

#plot [:][:] "1624301525742-5x5/type2-0.csv" using 1:2 title 'RLIoT' with lines, #	"1624301525742-5x5/type2-1.csv" using 1:2 title 'MEC-TI' with lines, #	"1624301525742-5x5/type2-2.csv" using 1:2 title 'EigenTrust' with lines

set ylabel 'Num of Communication' offset 2

plot [:][:] "1624301525742-5x5/type2-0.csv" using 1:10 title 'RLIoT' with lines,  	"1624301525742-5x5/type2-1.csv" using 1:10 title 'MEC-TI' with lines,  	"1624301525742-5x5/type2-2.csv" using 1:10 title 'EigenTrust' with lines

#set ylabel 'Distance' offset 2

#plot [:][:] "1624301525742-5x5/type2-0.csv" using 1:8 title 'RLIoT' with lines, # 	"1624301525742-5x5/type2-1.csv" using 1:8 title 'MEC-TI' with lines, # 	"1624301525742-5x5/type2-2.csv" using 1:8 title 'EigenTrust' with lines

unset multiplot
