set terminal png size 800,600
set output 'log_analysis.png'

set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%H:%M"

set title "Log Analysis: Error Types Over Time"
set xlabel "Time"
set ylabel "Number of Occurrences"
set grid

# Define the box width and fill style for bar charts
set boxwidth 0.1
set style fill solid 0.5

# Plot the counts for each type of log entry (Error, Warning, Info)
plot 'summary.csv' using 1:(($2 eq "Error") ? 1 : 0) with boxes title 'Errors', \
     '' using 1:(($2 eq "Warning") ? 1 : 0) with boxes title 'Warnings', \
     '' using 1:(($2 eq "Info") ? 1 : 0) with boxes title 'Info'
