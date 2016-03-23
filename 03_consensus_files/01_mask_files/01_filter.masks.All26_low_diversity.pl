#!/usr/bin/perl -w 
use strict; 
use warnings;

#---------------------------------------
my $usage = "filter.masks.All26";
#this program will filter the CGS data for all 26 females with respect to microsattelites, repeated elements, genes ...etc.
#---------------------------------------

my $population = "all26_females";

open( INPUT, "</Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/01_mask_files/mask."."$population".".chr.23.txt") or die "can't open masked file\n";

open( OUT, ">/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/01_mask_files/filtered_mask_files/filtered.mask."."$population".".chr.23_low_diversity.txt") or die "can't open output file\n";

my $mask_input = <INPUT>;
close INPUT;

my $filtered_sites = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/low_diversity_regions.txt";

open (INTERVAL, "<$filtered_sites") or die "can't open $filtered_sites";
my $lastEnd = 0;

while ( <INTERVAL> ) {
    
    my (undef, $start, $end) = split '\s+', $_; 
    my ($from, $length) = ($lastEnd, $start - $lastEnd);
    $length-- if $length > 0;

    ## change everything from the end of the last range
    ## to the start of this range to 'N'
    substr( $mask_input, $from, $length ) =~ tr[\x00-\xff][N];
    $lastEnd = $end;
    
    #test
    print "$start\t$end\n";
}

close INTERVAL;

## change everything from the end of the last range to the end of string to 'N'
substr( $mask_input, $lastEnd, length( $mask_input ) ) =~ tr[\x00-\xff][N];
	
print OUT "$mask_input";
