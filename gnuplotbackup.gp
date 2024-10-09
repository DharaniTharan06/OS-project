set terminal png size 800,600
set output 'log_analysis.png'

# Configure the x-axis to handle time data
set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%H:%M"

set title "Log Analysis: Error Types Over Time"
set xlabel "Time"
set ylabel "Number of Occurrences"
set grid

# Set the appropriate range for x-axis if needed (optional)
# set xrange ["2024-10-10 12:00:00":"2024-10-10 18:00:00"]  # Example of setting the time range

# Style for bars/boxes
set style fill solid 0.5
set boxwidth 0.1

# Plot data for each type
plot 'summary.csv' using 1:(strcol(2) eq "Error" ? 1 : 0) smooth cumulative with boxes title 'Errors', \
     'summary.csv' using 1:(strcol(2) eq "Warning" ? 1 : 0) smooth cumulative with boxes title 'Warnings', \
     'summary.csv' using 1:(strcol(2) eq "Info" ? 1 : 0) smooth cumulative with boxes title 'Info'

