use strict;
use warnings;
use Time::Piece;

# Disable output buffering so the time updates instantly
$| = 1;

# Every even integer greater than 2 can be expressed as the sum of two primes.
print("How many test cases? ");
my $userInput = <STDIN>;
chomp($userInput);

if ($userInput <= 0) {
    print("Number of test cases must be greater than 0.\n");
    exit;
}

my $failure = 0;
my $numTestCases = int(($userInput + 1) * 2);
my $success = 0;

# Get the current local time and format it
my $t = localtime;
my $current_time = $t->strftime('%H:%M:%S');

my @primes = (1) x ($numTestCases + 1);
$primes[0] = 0;
$primes[1] = 0;

my $sqrtMax = int(sqrt($numTestCases));

for (my $i = 2; $i <= $sqrtMax; $i++) {
    if ($primes[$i]) {
        for (my $j = $i * $i; $j <= $numTestCases; $j += $i) {
            $primes[$j] = 0;
        }
    }
}

# Loop through all even integers from 4 to the user-specified number of test cases
for (my $i = 4; $i <= $numTestCases; $i += 2) {
    my $topWindow = $i - 2;
    my $bottomWindow = 2;

    while ($bottomWindow <= $topWindow) {
        my $bottomIsPrime = $primes[$bottomWindow];
        my $topIsPrime = $primes[$topWindow];

        if ($bottomIsPrime && $topIsPrime) {
            $success++;
            last;
        }

        $bottomWindow++;
        $topWindow--;
    }

    if ($bottomWindow > $topWindow) {
        print("No primes found for $i\n");
        $failure++;
    }
}

my $t_end = localtime;
my $end_time = $t_end->strftime('%H:%M:%S');
print("Elapsed time: " . elapsed_time($current_time, $end_time) . "\n");

print("Success: $success\n");
print("Failure: $failure\n");

sub elapsed_time {
    my ($start, $end) = @_;
    my ($sh, $sm, $ss) = split(':', $start);
    my ($eh, $em, $es) = split(':', $end);
    my $start_seconds = $sh * 3600 + $sm * 60 + $ss;
    my $end_seconds = $eh * 3600 + $em * 60 + $es;
    my $elapsed = $end_seconds - $start_seconds;
    my $hours = int($elapsed / 3600);
    my $minutes = int(($elapsed % 3600) / 60);
    my $seconds = $elapsed % 60;
    return sprintf("%02d:%02d:%02d", $hours, $minutes, $seconds);
}