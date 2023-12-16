#!/usr/bin/env raku

if (@*ARGS.elems != 1) {
    say "Usage: $*PROGRAM <filepath>";
    exit 1;
}

my $input_file = shift @*ARGS;

if (!$input_file.IO.e) {
    say "$($input_file) does not exist";
    exit 1;
}

my $challenge_input = slurp $input_file;
my $lines := split / \n /, $challenge_input;
my @vals = ();

for $lines {
    next if $_ ~~ rx/ ^$ /;

    my $matches = $_ ~~ m:g/ \d /;
    my $first = $matches[0];
    my $last = $matches[$matches.elems - 1];
    @vals.push("{$first}{$last}");
}

say @vals.map({ +$_ }).sum;
