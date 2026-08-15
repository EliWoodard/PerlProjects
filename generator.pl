my @nouns = ('villan', 'hero', 'padawan');
my @adjectives = ('foolish', 'ignorant', 'weak');

my $noun = $nouns[rand @nouns];
my $adjective = $adjectives[rand @adjectives];

print "you $adjective $noun\n";