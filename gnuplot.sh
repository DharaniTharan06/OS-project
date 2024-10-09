set terminal png size 800,600
set output 'log_analysis.png'

set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%H:%M"

set title "Log Analysis: Error Types Over Time"
set xlabel "Time"
set ylabel "Number of Errors"
set grid

# Count occurrences of each error type
set style fill solid 0.5
set boxwidth 0.1
set style fill solid

# Creating separate datasets for each error type
plot 'summary.csv' using 1:(($2 eq "Error") ? 1 : 0) smooth sum with boxes title 'Errors', \
     '' using 1:(($2 eq "Warning") ? 1 : 0) smooth sum with boxes title 'Warnings', \
     '' using 1:(($2 eq "Info") ? 1 : 0) smooth sum with boxes title 'Info'
