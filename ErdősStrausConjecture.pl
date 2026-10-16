my $numTestCases = 4;

for (my $i = 2; $i <= $numTestCases; $i++) {

    my $goalValue = 4/$i;

    my $searching = 1;
    my $increment = 1;
    my $remainder = 0;
    my $x = 0;
    my $y = 0;
    my $z = 0;

    while($searching) {
        if (1/$increment == $goalValue) {
            $increment++;
        }
        elsif (1/$increment < $goalValue) {
            $searching = 0;
        }
        else {
            $increment++;
        }
    }

    $remainder = $goalValue - 1/$increment;
    $x = $increment;

    $searching = 1;

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

    while($searching) {
        if (1/$increment <= $remainder) {
            $searching = 0;
        }
        else {
            $increment++;
        }
    }

    $z = $increment;

    print("Goal: $goalValue, Solution: 1/$x + 1/$y + 1/$z\n");
}