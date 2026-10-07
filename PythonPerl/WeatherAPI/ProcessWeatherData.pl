use JSON;
use Data::Dumper;

# Get the file name from the command line argument
my $file_name = $ARGV[0];

# Open the json file for reading
open(my $fh, "<", "$file_name") or die "Could not open file '$file_name' $!";

# Take in the entire file content and decode it as JSON
my $json_text = do {
    local $/;
    <$fh>;
};
close($fh);

# Decode the JSON content into a Perl data structure
my $data = decode_json($json_text);

print("================================
       WEATHER REPORT
================================\n\n");

# Iterate over each location's forecast data
for my $location_forecast (@$data) {
    if (exists $location_forecast->{error}) {
        print "Error: $location_forecast->{error}\n";
        next;
    }

    # Get Location name from the forecast data
    my $location = $location_forecast->{location};
    # Print the location name
    print "$location\n";
    # Print - amount of location length
    print "-" x length($location) . "\n\n";

    # Initialize temperature and rain probability tracking variables
    my $coolest_temperature = 9999; # Initialize to a high value
    my $average_temperature = 0;
    my $hottest_temperature = 0;
    my $period_count = 0;
    my $temperature_unit = $location_forecast->{properties}->{periods}->[0]->{temperatureUnit};
    my $highest_rain_probability = 0;
    my $rain_probability = 0;
    my $start_date = $location_forecast->{properties}->{periods}->[0]->{startTime};
    $start_date =~ s/T.*//; # Extract only the date part
    my $end_date = $location_forecast->{properties}->{periods}->[-1]->{endTime};
    $end_date =~ s/T.*//; # Extract only the date part

    # Period number
    for my $period (@{$location_forecast->{properties}->{periods}}) {
        # Get hottest temperature
        if ($period->{temperature} > $hottest_temperature) {
            $hottest_temperature = $period->{temperature};
        }
        # Get coolest temperature
        if ($period->{temperature} < $coolest_temperature) {
            $coolest_temperature = $period->{temperature};
        }
        # Get rain probability for the current period
        my $probability_of_precipitation = $period->{probabilityOfPrecipitation}->{value} // 0;

        # Update highest rain probability if the current period's probability is higher
        if ($probability_of_precipitation > $highest_rain_probability) {
            $highest_rain_probability = $probability_of_precipitation;
        }

        # Accumulate rain probability for average calculation
        $rain_probability += $probability_of_precipitation;

        # Accumulate temperature for average calculation
        $average_temperature += $period->{temperature};
        $period_count++;

    }
    # Calculate average temprature propability
    my $average_tempature = $average_temperature / $period_count;
    # Calculate average rain probability and round down to nearest percent
    my $average_rain_probability = int(($rain_probability / $period_count) - 0.5);
    # Find total days the stored period count
    my $total_days = $period_count;
    # Print the weather report values
    print "Total Days: $total_days\n";
    print "Average Temperature: $average_tempature $temperature_unit\n";
    print "Coolest Temperature: $coolest_temperature $temperature_unit\n";
    print "Hottest Temperature: $hottest_temperature $temperature_unit\n";
    print "Average Rain Probability: $average_rain_probability%\n";
    print "Highest Rain Probability: $highest_rain_probability%\n\n";
}

print("================================
       END OF REPORT
================================\n");