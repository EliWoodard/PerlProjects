# Every even integer greater than 2 can be expressed as the sum of two primes.
my $numTestCases = 80;

my $isPrime = 1;

for (my $i = 4; $i <= $numTestCases; $i += 1) {
    $isPrime = 1;

    for (my $j = 2; $j <= $i / 2; $j++) {
        if ($i % $j == 0) {
            $isPrime = 0;
        }
    }

    if ($isPrime) {
        print("$i is a prime number\n");
    }
    else {
        print("$i is not a prime number\n");
    }
}