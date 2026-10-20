use strict;
use warnings;

my $numTestCases = 8;

for (my $i = 2; $i <= $numTestCases; $i++) {

    my $goalValue = 4/$i;

    my $searching = 1;
    my $increment = 1;
    my $remainder = 0;
    my $x = 0;
    my $y = 0;
    my $z = 0;

    # Original equation 4/n = 1/x + 1/y + 1/z
    # Modified equation 4xyz = n(xy + xz + yz)

    # Find the smallest x value that exists
    # x > n / 4
    $x = FindX($i);

    $remainder = $goalValue - 1/$x;

    while($searching) {
        if (1/$increment < $remainder) {
            $searching = 0;
        }
        else {
            $increment++;
        }
    }

    $y = $increment;
    $remainder -= 1/$y;

    $searching = 1;

    ## Before entering the third loop, calculate that denominator. Use % to check divisibility.
    ## Reject impossible pairs instead of hanging indefinitely.

    if ($i % 4 == 0) {
        $increment = $i / 4;
    }

    while($searching) {
        if (4*$x*$y*$increment == $i*($x*$y + $x*$increment + $y*$increment)) {
            $searching = 0;
        }
        else {
            $increment++;
        }
    }

    $z = $increment;

    print("Goal: $goalValue, Solution: 1/$x + 1/$y + 1/$z\n");
}

sub FindX {
    my ($value) = @_;
    return int($value / 4) + 1;
}