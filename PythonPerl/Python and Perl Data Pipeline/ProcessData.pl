use strict;
use warnings;
use JSON qw( decode_json );

my $fileName = $ARGV[0];

my $jsonText = do {
    open(my $fh, "<:encoding(UTF-8)", $fileName)
        or die("Could not open file '$fileName' $!");
    local $/;
    <$fh>;
};

my $data = decode_json($jsonText);

my $totalCPU = 0;
my $totalMemory = 0;
my $totalDisk = 0;

foreach my $detail (@$data) {
    $totalCPU += $detail->{cpu};
    $totalMemory += $detail->{memory};
    $totalDisk += $detail->{disk};
    print "Name: " . $detail->{name} . " - CPU: " . $detail->{cpu} . " - Memory: " . $detail->{memory} . " - Disk: " . $detail->{disk} . "\n";
}

print("===== Total Resource Usage =====\n\n");

print "Total CPU: $totalCPU\n";
print "Total Memory: $totalMemory\n";
print "Total Disk: $totalDisk\n";