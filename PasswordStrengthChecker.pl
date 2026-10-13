print("Enter your password: ");
my $userPassword = <STDIN>;

# Remove newline for user input
chomp($userPassword);

print("$userPassword is a valid password.\n");

my $passwordPoints = 0;

# User password is 8 or more in length
if (length($userPassword) >= 8) {
    $passwordPoints += 5;
}
else {
    print("Your password is not long enough.\n");
}

# User password has uppercase character
if ($userPassword =~ /[A-Z]/) {
    $passwordPoints += 5;
}
else {
    print("Your password must contain an uppercase letter.\n");
}

# User password has lowercase character
if ($userPassword =~ /[a-z]/) {
    $passwordPoints += 5;
}
else {
    print("Your password must contain a lowercase letter.\n");
}

# User password has a digit
if ($userPassword =~ /\d/) {
    $passwordPoints += 5;
}
else {
    print("Your password must contain a digit.\n");
}

# User password has a special character
if ($userPassword =~ /[^A-Za-z0-9]/) {
    $passwordPoints += 5;
}
else {
    print("Your password must contain a special character.\n");
}

print("Your password strength is: $passwordPoints/25\n");