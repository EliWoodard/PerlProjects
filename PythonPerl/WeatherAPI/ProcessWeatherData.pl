use JSON;
use Data::Dumper;

open(my $fh, "<", "weather.json") or die "Cannot open weather.json: $!";

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
        print "Is Daytime: $period->{isDaytime}\n";
        print "Temperature: $period->{temperature} $period->{temperatureUnit}\n";
        print "Temperature Trend: " . (defined $period->{temperatureTrend} ? $period->{temperatureTrend} : "N/A") . "\n";
        print "Probability of Precipitation: " . (defined $period->{probabilityOfPrecipitation}->{value} ? $period->{probabilityOfPrecipitation}->{value} : 0) . "%\n";
        print "Wind Speed: $period->{windSpeed}\n";
        print "Wind Direction: $period->{windDirection}\n";
        print "Short Forecast: $period->{shortForecast}\n";
        print "Detailed Forecast: $period->{detailedForecast}\n";
        print "\n";
    }
}