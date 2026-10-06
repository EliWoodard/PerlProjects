use JSON;
use Data::Dumper;

my $file_name = $ARGV[0];

open(my $fh, "<", "$file_name") or die "Could not open file '$file_name' $!";

my $json_text = do {
    local $/;
    <$fh>;
};
close($fh);

my $data = decode_json($json_text);

print "Decoded JSON data successfully.\n";

# Iterate over each location's forecast data
for my $location_forecast (@$data) {
    if (exists $location_forecast->{error}) {
        print "Error: $location_forecast->{error}\n";
        next;
    }

    print "Location: $location_forecast->{location}\n";

    my $coolest_temperature = 9999; # Initialize to a high value
    my $average_temperature = 0;
    my $hottest_temperature = 0;
    my $period_count = 0;

    # Period number
    for my $period (@{$location_forecast->{properties}->{periods}}) {
        print "Period Number: $period->{number}\n";
        print "Period Name: $period->{name}\n";
        my $start_time_formatted = $period->{startTime};
        $start_time_formatted =~ s/T/ /;
        $start_time_formatted =~ s/Z//;
        # Convert start time to date only format
        my $start_date_only = $start_time_formatted;
        $start_date_only =~ s/ .*//;
        print "Start Date Only: $start_date_only\n";
        # Convert end time to date only format
        my $end_time_formatted = $period->{endTime};
        $end_time_formatted =~ s/T/ /;
        $end_time_formatted =~ s/Z//;
        my $end_date_only = $end_time_formatted;
        $end_date_only =~ s/ .*//;
        print "End Date Only: $end_date_only\n";
        if ($period->{isDaytime}) {
            print "Is Daytime: true\n";
        }
        else {
            print "Is Daytime: false\n";
        }
        print "Temperature: $period->{temperature} $period->{temperatureUnit}\n";
        # Update hottest temperature
        if ($period->{temperature} > $hottest_temperature) {
            $hottest_temperature = $period->{temperature};
        }

        if ($period->{temperature} < $coolest_temperature) {
            $coolest_temperature = $period->{temperature};
        }
        print "Probability of Precipitation: " . (defined $period->{probabilityOfPrecipitation}->{value} ? $period->{probabilityOfPrecipitation}->{value} : 0) . "%\n";
        print "Wind Speed: $period->{windSpeed}\n";
        print "Wind Direction: $period->{windDirection}\n";
        print "Short Forecast: $period->{shortForecast}\n";
        print "Detailed Forecast: $period->{detailedForecast}\n";
        print "\n";

        # Accumulate temperature for average calculation
        $average_temperature += $period->{temperature};
        $period_count++;

    }
    my $average = $average_temperature / $period_count;
    print "Average Temperature: $average\n";
    print "Hottest Temperature: $hottest_temperature\n";
}