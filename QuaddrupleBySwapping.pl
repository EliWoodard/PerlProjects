my $foundButtHeadQuaddrupler = 0;
my $startingValue = 10;
my $userInput = 'n';

print("This shouldn't take long...\n");

# Run until found
while ($foundButtHeadQuaddrupler == 0) {
    # Convert $startingValue to a string
    my $startingValueStr = "$startingValue";

    # Swap last digit to first digit
    my $lastDigit = substr($startingValueStr, -1);
    my $swappedValueStr = $lastDigit . substr($startingValueStr, 0, -1);
    my $swappedValue = int($swappedValueStr);

    # Check if the swapped value is four times the starting value
    if ($swappedValue == 4 * $startingValue) {
        print("The butt-head quaddrupler is: $startingValue\n");
        print("Would you like to continue searching? (y/n): ");
        $userInput = <STDIN>;

        chomp($userInput);
        
        if ($userInput eq "n") {
            $foundButtHeadQuaddrupler = 1;
        }
        elsif ($userInput ne "y") {
            print("Invalid input. Please enter 'y' or 'n'.\n");
        }
        else {
            $startingValue++;
        }

    } else {
        $startingValue++;
    }
}