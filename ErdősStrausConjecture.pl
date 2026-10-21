use strict;
use warnings;

my $numTestCases = 80;

for (my $i = 2; $i <= $numTestCases; $i++) {

    my $found = 0;

    # Original equation:
    # 4/n = 1/x + 1/y + 1/z
    #
    # Denominator ordering: x <= y <= z
    # Integer equation:
    # 4xyz = n(xy + xz + yz)

    # x bounds: n/4 < x <= 3n/4
    my $xMin = int($i / 4) + 1;
    my $xMax = int(3 * $i / 4);

    X:
    for (my $x = $xMin; $x <= $xMax; $x++) {

        # R = 4/n - 1/x
        # R = (4x - n) / (nx)
        my $remainderNumerator = 4 * $x - $i;

        # y must satisfy:
        # nx / (4x - n) < y <= 2nx / (4x - n)
        my $yMin = int(($i * $x) / $remainderNumerator) + 1;
        my $yMax = int((2 * $i * $x) / $remainderNumerator);

        # Enforce x <= y
        $yMin = $x if $yMin < $x;

        for (my $y = $yMin; $y <= $yMax; $y++) {

            # Rearranging the original equation:
            # z = nxy / (4xy - nx - ny)

            my $zNumerator = $i * $x * $y;
            my $zDenominator =
                4 * $x * $y - $i * ($x + $y);

            next if $zDenominator <= 0;

            # z must be an integer
            next if $zNumerator % $zDenominator != 0;

            my $z = $zNumerator / $zDenominator;

            # Enforce y <= z
            next if $z < $y;

            print "n=$i: 4/$i = 1/$x + 1/$y + 1/$z\n";

            $found = 1;
            last X;
        }
    }

    print "n=$i: No solution found\n" if !$found;
}
