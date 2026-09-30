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

# Get temperature
my $temperature = $data->{properties}->{periods}->[0]->{temperature};
print "Temperature: $temperature F\n";

# Get wind speed
my $wind_speed = $data->{properties}->{periods}->[0]->{windSpeed};
print "Wind Speed: $wind_speed\n";