use JSON;
use strict;
use warnings;

open(my $fh, "<", "countries.json") or die "Cannot open countries.json: $!";
my @lines = <$fh>;
close($fh);

my $numberCountries = scalar @lines;
my $averagePopulation = 0;


foreach my $line (@lines) {
    my $data = eval { decode_json($line) };
    if ($@) {
        warn "Failed to parse JSON: $@";
        next;
    }
    print "Name: " . $data->{"name"} . "\n";
    print "Capital: " . $data->{"capital"} . "\n";
    print "Population: " . $data->{"population"} . "\n";
    $averagePopulation += $data->{"population"};
    print "Area in SqKm: " . $data->{"areaInSqKm"} . "\n";
    print "\n";
}

print("===== Summary =====\n");
print("Total number of countries: $numberCountries\n");
print("Average population: " . ($averagePopulation / $numberCountries) . "\n");