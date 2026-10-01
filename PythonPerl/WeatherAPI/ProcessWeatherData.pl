use JSON;
use Data::Dumper;

open(my $fh, "<", "countries.json") or die "Cannot open countries.json: $!";

my $json_text = do {
    local $/;
    <$fh>;
};
close($fh);

my $data = decode_json($json_text);

print "Decoded JSON data successfully.\n";

# Period number
my $period_number = $data->{properties}->{periods}->[0]->{number};
print "Period Number: $period_number\n";

# Period name
my $period_name = $data->{properties}->{periods}->[0]->{name};
print "Period Name: $period_name\n";

# Start time
my $start_time = $data->{properties}->{periods}->[0]->{startTime};
# Format start time to a more readable format
my $start_time_formatted = $start_time;
$start_time_formatted =~ s/T/ /;
$start_time_formatted =~ s/Z//;
# Convert time to date only format
my $date_only = $start_time_formatted;
$date_only =~ s/ .*//;
print "Date: $date_only\n";

# End time
my $end_time = $data->{properties}->{periods}->[0]->{endTime};
# Format end time to a more readable format
my $end_time_formatted = $end_time;
$end_time_formatted =~ s/T/ /;
$end_time_formatted =~ s/Z//;
# Convert end time to date only format
my $end_date_only = $end_time_formatted;
$end_date_only =~ s/ .*//;
print "End Date: $end_date_only\n";

# Is daytime
my $is_daytime = $data->{properties}->{periods}->[0]->{isDaytime};
print "Is Daytime: $is_daytime\n";

# Temperature
my $temperature = $data->{properties}->{periods}->[0]->{temperature};
my $temperature_unit = $data->{properties}->{periods}->[0]->{temperatureUnit};
print "Temperature: $temperature $temperature_unit\n";

# Temperature trend
my $temperature_trend = $data->{properties}->{periods}->[0]->{temperatureTrend};
print "Temperature Trend: " . (defined $temperature_trend ? $temperature_trend : "N/A") . "\n";

# Probability of precipitation
my $probability_of_precipitation = $data->{properties}->{periods}->[0]->{probabilityOfPrecipitation}->{value};
print "Probability of Precipitation: $probability_of_precipitation%\n";

# Wind speed
my $wind_speed = $data->{properties}->{periods}->[0]->{windSpeed};
print "Wind Speed: $wind_speed\n";

# Wind direction
my $wind_direction = $data->{properties}->{periods}->[0]->{windDirection};
print "Wind Direction: $wind_direction\n";

# Short forecast
my $short_forecast = $data->{properties}->{periods}->[0]->{shortForecast};
print "Short Forecast: $short_forecast\n";

# Detailed forecast
my $detailed_forecast = $data->{properties}->{periods}->[0]->{detailedForecast};
print "Detailed Forecast: $detailed_forecast\n";
