use strict;
use warnings;

# File name
my $filename = 'log.txt';

open(my $fh, '<', $filename) or die "Cannot open log file.";

my $infoCount = 0;
my $errorCount = 0;
my $warningCount = 0;
my @users;
my %uniqueErrors;

# loop through each line
while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /INFO/)
    {
        $infoCount++;
    }
    elsif ($line =~ /ERROR/)
    {
        $errorCount++;
    }
    elsif ($line =~ /WARNING/)
    {
        $warningCount++;
    }

    if($line =~ /\[INFO\] User logged in:\s*(.*)/)
    {
        push(@users, $1);
    }
    elsif($line =~ /\[ERROR\]\s*(.*)/)
    {
        if (!exists $uniqueErrors{$line})
        {
            $uniqueErrors{$1}++;
        }
    }
}

print("===== Log Summary =====\n\n");
print("INFO: $infoCount\n");
print("ERROR: $errorCount\n");
print("WARNING: $warningCount\n\n");
print("Users:\n");

foreach my $user (@users) {
    print("$user\n");
}

print("\nErrors:\n");
foreach my $key (sort keys %uniqueErrors)
{
    print "$key\n";
}