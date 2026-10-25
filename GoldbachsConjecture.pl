# Every even integer greater than 2 can be expressed as the sum of two primes.
my $numTestCases = 100000;
my $isPrime = 1;

for (my $i = 4; $i <= $numTestCases; $i += 2) {
    my $topWindow = $i - 2;
    my $bottomWindow = 2;

   my %primes;

    while ($bottomWindow <= $topWindow) {
        # Check bottom number
        if (!exists $primes{$bottomWindow}) {
            $primes{$bottomWindow} = IsPrime($bottomWindow);
        }
        my $bottomIsPrime = $primes{$bottomWindow};

        # Check top number
        if (!exists $primes{$topWindow}) {
            $primes{$topWindow} = IsPrime($topWindow);
        }
        my $topIsPrime = $primes{$topWindow};

        if ($bottomIsPrime && $topIsPrime) {
            print("$i = $bottomWindow(prime) + $topWindow(prime)\n");
            last;
        }

        $bottomWindow++;
        $topWindow--;
    }

    if ($bottomWindow > $topWindow) {
        print("No primes found for $i\n");
    }
}

sub IsPrime {
    my $num = shift;
    my $isPrime = 1;

    for (my $j = 2; $j <= sqrt($num) / 2; $j++) {
        if ($num % $j == 0) {
            $isPrime = 0;
            last;
        }
    }

    return $isPrime;
}