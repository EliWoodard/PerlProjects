use strict;
use warnings;

# File name
my $filename = 'characterData.txt';

# Open the file in write mode ('>')
open(my $fh, '+<', $filename) or die "Could not open file '$filename' $!";

# Initalize hash value
my %characters;

# Loop through each line
while (my $line = <$fh>) {
    chomp($line);
    my @characterData = split(/,/, $line);
    # Populate hash value
    $characters{$characterData[0]} = [$characterData[1], $characterData[2]];
}

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

# Rewrite file with new hash data
# Delete file content
truncate($fh, 0) or die "Cannot truncate file: $!";
# Reset file pointer
seek($fh, 0, 0) or die "Cannot seek to beginning: $!";

foreach my $key (keys %characters)
{
    # Get hash value for selected key
    my @hashValue = @{$characters{$key}};
    # Write to file for current hash values
    print $fh "$key,$hashValue[0],$hashValue[1]\n";
}

# Close the filehandle
close($fh);

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