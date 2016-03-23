#!/usr/bin/perl -w
use strict;
use warnings;

#-------------------------------------------------------------------------------
# What: Determine how many called sites are in a given interval 
my $usage = "filtered_26_females.pl"; 
#-------------------------------------------------------------------------------

my $total = 0; 

my $population = "all26_females";
#my $population = "9Afr_females";
#my $population = "5Eur_females";

my $output_file = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/02_called_sites/filtered_called_sites_by_region/All26_females_low.txt";
open (OUT, ">$output_file") or die "can't open output file\n";

my $input_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/01_mask_files/filtered_mask_files/";

my $input_file = "$input_dir"."filtered."."mask."."$population".".chr.23"."_low.txt";
	
open(CGS, "<$input_file") or die "can't open $input_file\n";

my $cgs = <CGS>;

my $CGS_low1 = substr( $cgs, 10241177, 12619185 );  

print OUT "low1 length= ".length $CGS_low1;
 
printf OUT " found %d zeros\n", $CGS_low1 =~ tr[0][]; 

my $CGS_low2 = substr( $cgs, 16946047, 18747389 );  

print OUT "low2 length= ".length $CGS_low2;
 
printf OUT " found %d zeros\n", $CGS_low2 =~ tr[0][]; 

my $CGS_low3 = substr( $cgs, 19303480, 22198160 );  

print OUT "low3 length= ".length $CGS_low3;
 
printf OUT " found %d zeros\n", $CGS_low3 =~ tr[0][]; 

my $CGS_low4 = substr( $cgs, 38344992, 41272675 );  

print OUT "low4 length= ".length $CGS_low4;
 
printf OUT " found %d zeros\n", $CGS_low4 =~ tr[0][]; 

my $CGS_low5 = substr( $cgs, 45930478, 77954462 );  

print OUT "low5 length= ".length $CGS_low5;
 
printf OUT " found %d zeros\n", $CGS_low5 =~ tr[0][]; 

my $CGS_low6 = substr( $cgs, 99459295, 111145964 );  

print OUT "low6 length= ".length $CGS_low6;
 
printf OUT " found %d zeros\n", $CGS_low6 =~ tr[0][]; 

my $CGS_low7 = substr( $cgs, 128232540, 136796526 );  

print OUT "low7 length= ".length $CGS_low7;
 
printf OUT " found %d zeros\n", $CGS_low7 =~ tr[0][]; 

my $CGS_low8 = substr( $cgs, 151519514, 155156362 );  

print OUT "low8 length= ".length $CGS_low8;
 
printf OUT " found %d zeros\n", $CGS_low8 =~ tr[0][]; 
