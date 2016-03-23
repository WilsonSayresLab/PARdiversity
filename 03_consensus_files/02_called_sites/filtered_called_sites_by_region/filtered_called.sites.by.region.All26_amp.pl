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

my $output_file = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/02_called_sites/filtered_called_sites_by_region/All26_females_amp.txt";
open (OUT, ">$output_file") or die "can't open output file\n";

my $input_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/01_mask_files/filtered_mask_files/";

my $input_file = "$input_dir"."filtered."."mask."."$population".".chr.23"."_amp.txt";
	
open(CGS, "<$input_file") or die "can't open $input_file\n";

my $cgs = <CGS>;

my $CGS_amp1 = substr( $cgs, 48202745, 48292983 );  

print OUT "amp1 length= ".length $CGS_amp1;
 
printf OUT " found %d zeros\n", $CGS_amp1 =~ tr[0][]; 

my $CGS_amp2 = substr( $cgs, 48976199, 49062381 );  

print OUT "amp2 length= ".length $CGS_amp2;
 
printf OUT " found %d zeros\n", $CGS_amp2 =~ tr[0][]; 

my $CGS_amp3 = substr( $cgs, 51395467, 51492862 );  

print OUT "amp3 length= ".length $CGS_amp3;
 
printf OUT " found %d zeros\n", $CGS_amp3 =~ tr[0][]; 

my $CGS_amp4 = substr( $cgs, 51775560, 51966529 );  

print OUT "amp4 length= ".length $CGS_amp4;
 
printf OUT " found %d zeros\n", $CGS_amp4 =~ tr[0][]; 

my $CGS_amp5 = substr( $cgs, 52518132, 53027386 );  

print OUT "amp5 length= ".length $CGS_amp5;
 
printf OUT " found %d zeros\n", $CGS_amp5 =~ tr[0][]; 

my $CGS_amp6 = substr( $cgs, 55464117, 55574172 );  

print OUT "amp6 length= ".length $CGS_amp6;
 
printf OUT " found %d zeros\n", $CGS_amp6 =~ tr[0][]; 

my $CGS_amp7 = substr( $cgs, 62335733, 62495350 );  

print OUT "amp7 length= ".length $CGS_amp7;
 
printf OUT " found %d zeros\n", $CGS_amp7 =~ tr[0][]; 

my $CGS_amp8 = substr( $cgs, 70894117, 71055682 );  

print OUT "amp8 length= ".length $CGS_amp8;
 
printf OUT " found %d zeros\n", $CGS_amp8 =~ tr[0][]; 

my $CGS_amp9 = substr( $cgs, 71941159, 72325075 );  

print OUT "amp9 length= ".length $CGS_amp9;
 
printf OUT " found %d zeros\n", $CGS_amp9 =~ tr[0][]; 

my $CGS_amp10 = substr( $cgs, 100818723, 100903977 );  

print OUT "amp10 length= ".length $CGS_amp10;
 
printf OUT " found %d zeros\n", $CGS_amp10 =~ tr[0][]; 

my $CGS_amp11 = substr( $cgs, 101435778, 101774391 );  

print OUT "amp11 length= ".length $CGS_amp11;
 
printf OUT " found %d zeros\n", $CGS_amp11 =~ tr[0][]; 

my $CGS_amp12 = substr( $cgs, 103195105, 103362341 );  

print OUT "amp12 length= ".length $CGS_amp12;
 
printf OUT " found %d zeros\n", $CGS_amp12 =~ tr[0][]; 



