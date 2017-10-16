#!/usr/local/bin/perl

use strict;
use warnings;

my $usage = "usage: $0 *_R1.fasta *_R1.fasta outfile.fasta\n\n";
my ($r1,$r2,$out) = @ARGV or die $usage;

open (R1,$r1) or die "Can't open $r1: $!";
open (R2,$r2) or die "Can't open $r2: $!";
open (OUT,'>',$out) or die "Can't write to $out: $!";

my $count=0;

while (<R1>) {
    print OUT ">read$count\/1\n";
    $_ = <R1>;
    print OUT $_; 
    
    $_ = <R2>;
    print OUT ">read$count\/2\n";
    $_ = <R2>;
    print OUT $_;
    $count++;
}

close OUT or die "Can't write to $out: $!";

exit(0);
