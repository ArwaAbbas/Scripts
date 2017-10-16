#!/usr/local/bin/perl

use strict;
use warnings;
use List::MoreUtils qw(uniq);


my $usage = "usage: $0 BLAST_Viral_db_List ResultsOutput \n\n";
my $virus_db = $ARGV[0] or die $usage;
my $data = $ARGV[1] or die $usage;

open (my $File, $virus_db) or die "$usage";
my %HashRefs; my %HashRef2Descr; my %HashRef2Readcount; my %HashRef2Reads;

while (my $line = <$File>) {
    chomp $line;
    my ($ref_seq, $description, $length) = split(/\t/, $line);
    my $string = "0"x$length;
    $HashRefs{$ref_seq} = $string;
    $HashRef2Descr{$ref_seq} = $description;
    $HashRef2Readcount{$ref_seq} = 0;
    $HashRef2Reads{$ref_seq} = '';
}
close $File;

open (my $DataFile, $data) or die "$usage";
while (my $line = <$DataFile>) {
    chomp $line;
    if ($line !~ m/^\#/) {
	my @x = split(/\t/, $line);
	my $query = $x[0];
	my $ref_seq = $x[1];
	
	# save read in hash to later determine number of paired reads that had a match
	my $temp_read = $HashRef2Reads{$ref_seq};
	$HashRef2Reads{$ref_seq} = "$temp_read"."\t$query";	

	#increment the read count by 1
	my $read_count = $HashRef2Readcount{$ref_seq};
	$read_count++;
	$HashRef2Readcount{$ref_seq} = $read_count;
	my $start_pos = $x[8];
	my $end_pos = $x[9];
	if ($start_pos > $end_pos) {
	    my $temp = $end_pos;
	    $end_pos = $start_pos;
	    $start_pos =$temp;
	} 
	$end_pos = $end_pos -1;
	$start_pos =  $start_pos -1;
	my $len = $end_pos - $start_pos;
	# mark query's location on the ref_seq
	if (exists $HashRefs{$ref_seq}) {
	    my $string = $HashRefs{$ref_seq};
	    # my $ref_length = length($string);
	    my $substitute = "1"x$len;
	    substr ($string, $start_pos, $len, $substitute);
	    $HashRefs{$ref_seq} = $string;
	}
    }
}
close $DataFile;

print "Genbank_ID\tDescription\tNumberOfReads\tGenomeCovered(bp)\tFractionofGenomeCovered\tConcordantPairedReads\tFractionConcordantReads\n";
# for every hash entry, sum the 1s and divide by length of string 
while ( my ($key, $value) = each(%HashRefs) ) {
    my $read_count = $HashRef2Readcount{$key};
    if ($read_count != 0) {
	my $all_reads = $HashRef2Reads{$key};
	
        ## parse out all of the reads for each gID and determine the percentage of them that are paired
	my @Non_uniq_reads =split(/\t/, $all_reads);
        my @reads = uniq @Non_uniq_reads; ## only want the unique reads to count
	my $num_of_paired = 0;
	my %Reads;
	shift(@reads);
	foreach(@reads){
	    my ($read_num, $num) = split(/\//,$_);
	    if(exists $Reads{$read_num}){
		$num_of_paired++;
		$num_of_paired++;
	    }
	    else{
		$Reads{$read_num} = '';
	    }
	}

	print "$key\t";
	my $description =  $HashRef2Descr{$key};
	print "$description\t$read_count\t";
	# value length
	my $length = length($value);
	# sum 1s in value
	my $sum = 0;
	$sum += $_ for split(//, $value);
	my $percent = $sum/$length;
	my $percent_reads = $num_of_paired/$read_count;
	print "$sum\/$length\t$percent\t$num_of_paired\/$read_count\t$percent_reads\n";
    }
}

exit(0);
