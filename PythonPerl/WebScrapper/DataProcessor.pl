use JSON;
use strict;
use warnings;

open(my $fh, "<", "countries.json") or die "Cannot open countries.json: $!";
my @lines = <$fh>;
close($fh);

my $numberCountries = scalar @lines;
my $averagePopulation = 0;
my $largestPopulationTotal = 0;
my $smallestPopulationTotal = 0;
my $largestPopulationCountry = "";
my $smallestPopulationCountry = "";
my $largestAreaTotal = 0;
my $largestAreaCountry = "";
my @countriesRankedByPopulation = ();


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

    if ($data->{"population"} > $largestPopulationTotal) {
        $largestPopulationTotal = $data->{"population"};
        $largestPopulationCountry = $data->{"name"};
    }

    if ($smallestPopulationTotal == 0 || $data->{"population"} < $smallestPopulationTotal) {
        $smallestPopulationTotal = $data->{"population"};
        $smallestPopulationCountry = $data->{"name"};
    }

    if ($data->{"areaInSqKm"} > $largestAreaTotal) {
        $largestAreaTotal = $data->{"areaInSqKm"};
        $largestAreaCountry = $data->{"name"};
    }

    print "Area in SqKm: " . $data->{"areaInSqKm"} . "\n";
    print "\n";

    push @countriesRankedByPopulation, {
        name => $data->{"name"},
        population => $data->{"population"}
    };
}

@countriesRankedByPopulation = sort { $b->{population} <=> $a->{population} } @countriesRankedByPopulation;

print("===== Countries Ranked by Population =====\n");
foreach my $country (@countriesRankedByPopulation) {
    print("Country: " . $country->{name} . "\n");
    print("Population: " . $country->{population} . "\n");
    print("\n");
}

print("===== Summary =====\n");
print("Total number of countries: $numberCountries\n");
print("Average population: " . ($averagePopulation / $numberCountries) . "\n");

print("===== Largest Population =====\n");
print("Country: $largestPopulationCountry\n");
print("Population: $largestPopulationTotal\n");



print("===== Smallest Population =====\n");
print("Country: $smallestPopulationCountry\n");
print("Population: $smallestPopulationTotal\n");

print("===== Largest Area =====\n");
print("Country: $largestAreaCountry\n");
print("Area in SqKm: $largestAreaTotal\n");