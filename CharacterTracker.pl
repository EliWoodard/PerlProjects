# Starting hash values
my %characters = (
    "Gandalf" => ["Wizard", 20],
    "Aragorn" => ["Warrior", 18],
    "Legolas" => ["Ranger", 19],
);
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