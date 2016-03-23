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

my $output_file = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/02_called_sites/filtered_called_sites_by_region/All26_females_minus_amp.txt";
open (OUT, ">$output_file") or die "can't open output file\n";

my $input_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/01_mask_files/filtered_mask_files/";

my $input_file = "$input_dir"."filtered."."mask."."$population".".chr.23"."_minus_amp.txt";
	
open(CGS, "<$input_file") or die "can't open $input_file\n";

my $cgs = <CGS>;

# my $CGS_PAR1 = substr( $cgs, 0, 2699000 );  
# 
# print OUT "PAR1 length= ".length $CGS_PAR1;
#  
# printf OUT " found %d zeros\n", $CGS_PAR1 =~ tr[0][]; 
# 
# my $CGS_PAR2 = substr( $cgs, 154940561);  
# 
# print OUT "PAR2 length= ".length $CGS_PAR2;
#  
# printf OUT " found %d zeros\n", $CGS_PAR2 =~ tr[0][];
# 
# my $CGS_XTR = substr( $cgs, 88193855, 5000000 );  
# 
# print OUT "XTR length= ".length $CGS_XTR;
#  
# printf OUT " found %d zeros\n", $CGS_XTR =~ tr[0][];

my $CGS_nonPAR_minus_amp = substr( $cgs, 2699001, 152241558 );  

print OUT "nonPAR_minus_amp length= ".length $CGS_nonPAR_minus_amp;
 
printf OUT " found %d zeros\n", $CGS_nonPAR_minus_amp =~ tr[0][];



