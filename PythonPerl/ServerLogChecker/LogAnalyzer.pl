use strict;
use warnings;
use JSON qw(encode_json);

open(my $fh, "<", "server.log") or die "Cannot open server.log: $!";
my @logs = <$fh>;
close($fh);

my $summary = {
    total_entries => 0,
    error_count => 0,
    warning_count => 0,
    info_count => 0,
    first_entry => '',
    last_entry => '',
};

for my $log (@logs) {
    $summary->{total_entries}++;
    
    if ($log =~ /INFO/) {
        $summary->{info_count}++;
    } elsif ($log =~ /WARNING/) {
        $summary->{warning_count}++;
    } elsif ($log =~ /ERROR/) {
        $summary->{error_count}++;
    }
    if ($summary->{first_entry} eq '') {
        $summary->{first_entry} = $log;
    }
    $summary->{last_entry} = $log;
}

open (my $out, ">", "summary.json") or die "Cannot open summary.json: $!";
print $out encode_json($summary);
close($out);