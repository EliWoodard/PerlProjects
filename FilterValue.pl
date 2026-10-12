my @processes = ("nginx", "perl", "mysql", "python", "node", "postgres");

# Use grep to get values with 4 or more characters 
my @filtered_processes = grep { length($_) > 4 } @processes;

# Print the filtered processes
foreach my $process (@filtered_processes) {
    my $upper_process = uc($process);
    print "$upper_process\n";
}