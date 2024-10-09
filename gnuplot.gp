set terminal png size 800,600
set output 'log_analysis.png'

# Configure the x-axis to handle time data
set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%H:%M:%S"

set title "Log Analysis: Error Types Over Time"
set xlabel "Time"
set ylabel "Number of Occurrences"
set grid

# Style for points
set style data points
set pointsize 0.5

# Plot data for each type
plot 'summary.csv' using 1:(strcol(2) eq "Error" ? 1 : 0) title 'Errors', \
     'summary.csv' using 1:(strcol(2) eq "Warning" ? 1 : 0) title 'Warnings'

# Print the first few lines of data to the console
print "First few lines of data:"
do for [i=1:5] {
    set print "-"
    print system(sprintf("sed -n '%dp' summary.csv", i))
}

