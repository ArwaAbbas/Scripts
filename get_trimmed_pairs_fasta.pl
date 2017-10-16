##takes in a Fasta file and outputs kmers of size 100 (sliding window for each fasta sequence)

#!/usr/bin/perl

my $usage= "Usage: perl $0 input_file_R1.fasta input_file_R1.fasta input_file_R2.fasta output_file_R1.fasta output_file_R2.fasta\n\n\n";
my $r1 = $ARGV[0] or die $usage;
my $r2 = $ARGV[1] or die $usage;
my $out_r1 = $ARGV[2] or die $usage;
my $out_r2 = $ARGV[3] or die $usage;

my %r1;
my %r2; 

## store reads into hash tables
open (my $File1, $r1) or die "$usage";
while (my $line = <$File1>) {
    chomp $line;
    if ($line =~ m/\>([^\ ]+)/){
	$r1{$1} = "";
    }
}
close($File1);

open (my $File2, $r2) or die "$usage";
while (my $line = <$File2>) {
    chomp $line;
    if ($line =~ m/\>([^\ ]+)/){
	$r2{$1} = "";
    }
}
close($File2);

## read line by line and assess if header is in the hash table
open(my $fh, '>', $out_r1) or die $usage;
open (my $File3, $r1) or die $usage;
while (my $line = <$File3>) {
    chomp $line;
    if ($line =~ m/\>([^\ ]+)/){
	if (exists $r2{$1}) {
	    print $fh "$line\n";
	    $line=<$File3>;
	    print $fh "$line";
	}
    }
}
close $fh;

open (my $File4, $r2) or die "$usage"; 
open(my $fh2, '>', $out_r2) or die $usage;
while (my $line = <$File4>) {
    chomp $line;
        if ($line =~ m/\>([^\ ]+)/){
	    if (exists $r1{$1}) {
		print $fh2 "$line\n";
		$line=<$File4>;
		print $fh2 "$line";
	    }
	}
}
close $fh2;

exit(0);
