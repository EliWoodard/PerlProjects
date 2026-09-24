use strict;
use warnings;
use JSON qw( decode_json encode_json );

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

my $summary = {
    totalCPU => $totalCPU,
    totalMemory => $totalMemory,
    totalDisk => $totalDisk
};

my $newFileName = "summary.json";

open(my $fh2, ">", $newFileName) or die "Can't open '$newFileName': $!";
print $fh2 encode_json($summary);
close($fh2) or die "Cannot close file: $!";