#!/usr/bin/perl
use warnings;
use strict;

my $seq = "";
my $id;
while (<STDIN>) {
    chomp;
    if ($_ =~ />([^\s]+)/) {
        if ($seq ne "") {
            &print_fa_len($id, $seq);
        }
        $id = $1;
        $seq = "";
    } else {
       $seq .= $_;
    }
}
if ($seq ne "") {
    &print_fa_len($id, $seq);
}

sub print_fa_len {
    my $id = shift(@_);
    my $seq = shift(@_);
    my $l = length($seq);
	print $id."\t".$l."\n";
}
