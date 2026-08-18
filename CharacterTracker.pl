use strict;
use warnings;

# Starting hash values
my %characters = (
    "Gandalf" => ["Wizard", 20],
    "Aragorn" => ["Warrior", 18],
    "Legolas" => ["Ranger", 19],
);

my $continue = 1;

print "==============================\n";
print "Welcome to Character Select\n";

while ($continue == 1) {
    print "==============================\n";
    print "1. Add new character\n";
    print "2. Delete existing character\n";
    print "3. View all character records\n";
    print "4. View one character record\n";
    print "==============================\n";
    my $userValue = <STDIN>;
    chomp($userValue);

    if($userValue == 1)
    {
        AddCharacter();
    }
    elsif ($userValue == 2)
    {
        DeleteCharacter();
    }
    elsif ($userValue == 3)
    {
        ViewAllCharacters();
    }
    elsif($userValue == 4)
    {
        GetCharacter();
    }
    else
    {
        print("Invalid value, please try again.\n");
        next;
    }

    # Check if user wants to continue
    print("Do you want to continue(Y/N)?\n");

    $userValue = <STDIN>;
    chomp($userValue);
    $userValue = lc($userValue);

    while($userValue ne "y" && $userValue ne "n")
    {
        print("Invalid input, please try again.\n");
        $userValue = <STDIN>;
        chomp($userValue);
    }

    if ($userValue eq "n")
    {
        $continue = 0;
    }
}

sub AddCharacter
{
    # Get character name
    print("What is the name of your new character?\n");
    my $newCharacterName = <STDIN>;
    chomp($newCharacterName);
    # Get character class
    print("What is your new character's class?\n");
    my $newCharacterClass = <STDIN>;
    chomp($newCharacterClass);
    # Get character level
    print("What is your new character's level?\n");
    my $newCharacterLevel = <STDIN>;
    chomp($newCharacterLevel);
    # Add values into a hash record
    $characters{$newCharacterName} = [$newCharacterClass, $newCharacterLevel];
}

sub DeleteCharacter
{
    # Attempt to delete user selected character
    print("Which character would you like to delete?\n");
    my $selectedCharacterName = <STDIN>;
    chomp($selectedCharacterName);
    my $removed = delete $characters{$selectedCharacterName};

    # Check if character is in records
    if (!defined $removed)
    {
        print("$selectedCharacterName does not exist.\n");
    }
}

sub GetCharacter
{
    # Intro to program
    print("Character name?\n");
    # Get user input
    my $userCharacterSelect = <STDIN>;
    # Clean user input
    chomp($userCharacterSelect);
    # Check if user value is valid
    if (exists $characters{$userCharacterSelect}) {
        my @hashValue = @{$characters{$userCharacterSelect} };
        print "$userCharacterSelect is a $hashValue[0], and level $hashValue[1]\n";
    }
    else {
        print("$userCharacterSelect does not exist as a record.\n");
    }
}

sub ViewAllCharacters()
{
    foreach my $key (keys %characters)
    {
        my @hashValue = @{$characters{$key} };
        print "$key is a $hashValue[0], and level $hashValue[1]\n";
    }
}