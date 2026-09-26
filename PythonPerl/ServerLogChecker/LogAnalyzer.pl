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
    most_common_error => '',
    server_with_most_errors => '',
};

my %errorTypes = ();
my %serverErrors = ();

for my $log (@logs) {
    $summary->{total_entries}++;


    if ($log =~ /INFO/) {
        $summary->{info_count}++;
    } elsif ($log =~ /WARNING/) {
        $summary->{warning_count}++;
    } elsif ($log =~ /ERROR/) {
        $summary->{error_count}++;
        if ($log =~ /ERROR (.+)$/) {
            my $errorMessage = $1;
            $errorTypes{$errorMessage}++;
        }
        if ($log =~ /ERROR server(\d+)/) {
            my $server = $1;
            $serverErrors{$server}++;
        }
    }
    if ($summary->{first_entry} eq '') {
        $summary->{first_entry} = $log;
    }
    $summary->{last_entry} = $log;
}
my $mostCommonError = '';
my $maxCount = 0;
for my $error (keys %errorTypes) {
    if ($errorTypes{$error} > $maxCount) {
        $maxCount = $errorTypes{$error};
        $mostCommonError = $error;
    }
}
$summary->{most_common_error} = $mostCommonError;

my $serverWithMostErrors = '';
my $maxServerErrorCount = 0;
for my $server (keys %serverErrors) {
    if ($serverErrors{$server} > $maxServerErrorCount) {
        $maxServerErrorCount = $serverErrors{$server};
        $serverWithMostErrors = $server;
    }
}
$summary->{server_with_most_errors} = $serverWithMostErrors;

open (my $out, ">", "summary.json") or die "Cannot open summary.json: $!";
print $out encode_json($summary);
close($out);