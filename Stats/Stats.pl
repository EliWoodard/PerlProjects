my $param  = $ARGV[0];
my $lineCount = 0;
my $wordCount = 0;
my $charCount = 0;

open(my $fh, '<', $param) or die "Cannot open file, it may not exist.";

while (my $line = <$fh>) {
    chomp $line;
    my @words = split(/\s+/, $line);
    $charCount += $line =~ tr/A-Za-z0-9//;
    $wordCount += scalar @words;
    $lineCount++;
}

print("===== File Statistics =====\n\n");
print("File Name: $param\n");
print("Number of Lines: $lineCount\n");
print("Number of Words: $wordCount\n");
print("Number of Characters: $charCount\n");