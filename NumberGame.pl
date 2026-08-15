my $playing = 1; # true
my $playerInput;

while ($playing == 1) {
    RunRandomGame();

    print("Do you want to play again(Y/N)?\n");

    $playerInput = <STDIN>;
    chomp($playerInput);
    $playerInput = lc($playerInput);

    while ($playerInput ne "y" && $playerInput ne "n")
    {
        print("Invalid value. Do you want to play again(Y/N).\n");
        $playerInput = <STDIN>;
        chomp($playerInput);
        $playerInput = lc($playerInput);
    }

    if ($playerInput eq "n")
    {
        $playing = 0;
    }
}

sub RunRandomGame {
    my $guessNumber = 0;
    my $numberGuesses = 0;
    my $randomNumber = int(rand(101));

    print("Guess the number between 0 and 100, in 7 attempts.\n");

    while ($randomNumber != $guessNumber && $numberGuesses < 7)
    {
        $guessNumber = <STDIN>;
        chomp($guessNumber);

        if ($guessNumber < $randomNumber)
        {
            print("Too low\n");
        }
        elsif ($guessNumber > $randomNumber)
        {
            print("Too high\n");
        }
        $numberGuesses++;
    }

    if ($numberGuesses == 7 && $guessNumber != $randomNumber)
    {
        print ("Wrong, the random number is $randomNumber\n");
    }
    else
    {
        print ("Correct, the random number is $randomNumber\n");
    }
}