my $param  = $ARGV[0];

open(my $fh, '<', $param) or die "Cannot open file, it may not exist.";

my %applicationSettings;

while (my $line = <$fh>) {
    chomp $line;
    my ($key, $value) = split(/=/, $line, 2);
    $applicationSettings{$key} = $value;
}

print("===== Configuration =====\n\n");

print("Name: $applicationSettings{name}\n");
print("Version: $applicationSettings{version}\n");
print("Debug: $applicationSettings{debug}\n");
print("Max Users: $applicationSettings{max_users}\n");
print("Environment: $applicationSettings{environment}\n");