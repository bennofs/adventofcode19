#!/usr/bin/perl
use strict;
use warnings;

my @program = split(',', <STDIN>);

sub execute {
    my ($program, $noun, $verb) = @_;
    my @memory = @$program;
    @memory[1] = $noun;
    @memory[2] = $verb;

    my $i = 0;
    while ($memory[$i] != 99) {
        my $opcode = $memory[$i];
        my $a = $memory[$memory[$i + 1]];
        my $b = $memory[$memory[$i + 2]];
        my $r_pos = $memory[$i + 3];
        $i += 4;

        my $result;
        if ($opcode == 1) {
            $result = $a + $b;
        }
        if ($opcode == 2) {
            $result = $a * $b;
        }

        $memory[$r_pos] = $result;
    }

    return $memory[0];
}


print execute(\@program, 12, 99), "\n";

foreach my $noun (1..99) {
    foreach my $verb (1..99) {
        my $result = execute(\@program, $noun, $verb);
        if ($result == 19690720) {
            print (100 * $noun + $verb);
        }
    }
}
