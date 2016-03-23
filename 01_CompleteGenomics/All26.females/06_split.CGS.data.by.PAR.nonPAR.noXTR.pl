#!usr/bin/perl -w
use strict;
use warnings;

#----------------------------------------------------------------------------------
my $usage = "split.CGS.data.by.PAR.pl";
#this program will split the filtered CGS data into 3 windows
#----------------------------------------------------------------------------------

#my $c = 0; 

my $cg_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/filtered.CGS.All26.txt";		
my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/";

my $output_file_PAR1 = "$output_directory"."split.CGS.All26.PAR1.test.txt";
my $output_file_nonPAR = "$output_directory"."split.CGS.All26.nonPAR.NOXTR.txt";
my $output_file_PAR2 = "$output_directory"."split.CGS.All26.PAR2.test.txt";

#open ( OUT_PAR1, ">$output_file_PAR1" ) or die "can't open\n";
open ( OUT_nonPAR, ">$output_file_nonPAR" ) or die "can't\n";
#open ( OUT_PAR2, ">$output_file_PAR2" ) or die "can't open\n";

open (INPUT, "<$cg_input") or die "can't open $cg_input\n";

foreach (<INPUT>) {
	
	my @SNPS = <INPUT>;
	my @get_SNPS = split ( '\s', $_ ); 
	
	#if ($get_SNPS[3] < "2699000") {
	#	print OUT_PAR1 "@get_SNPS\n";
	#}
	
	if (($get_SNPS[3] >= "2700000") && ($get_SNPS[3] <= "88193855") || ($get_SNPS[3] >= "93193855") && ($get_SNPS[3] <= "154940559")) {
		print OUT_nonPAR "@get_SNPS\n";
	}
	#if ($get_SNPS[3] >= "154940559") {
	#	print OUT_PAR2 "@get_SNPS\n";
	#}
}