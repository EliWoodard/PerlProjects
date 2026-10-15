print("Enter a number: ");
my $userInputNumber = <STDIN>;
chomp($userInputNumber);

my $userInt = int($userInputNumber);

my $continueLoop = 1;


if ($userInt <= 1) {
    print("Please enter a positive integer greater than 1.\n");
} else {
    while($continueLoop == 1) {
        if ($userInt == 1) {
            $continueLoop = 0;
        } 
        elsif ($userInt <= 0) {
            print("Failed to compute Collatz sequence.\n");
            $continueLoop = 0;
        }
        else {
            if ($userInt % 2 == 0) {
                $userInt = $userInt / 2;
            } else {
                $userInt = 3 * $userInt + 1;
            }
            print("$userInt\n");
        }

    }
}