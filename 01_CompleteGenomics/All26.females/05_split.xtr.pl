#!usr/bin/perl -w
use warnings; 
use strict; 

#------------------------------------------------
my $usage = "split.xtr.pl";
#print out only the XTR from filtered CGS data
#------------------------------------------------	

my $cg_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/filtered.CGS.All26.txt";	
	
my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/";

my $output_file_XTR = "$output_directory"."split.CGS.All26.XTR.txt";

open ( OUT_XTR, ">$output_file_XTR" ) or die "can't open XTR\n";

open (INPUT, "<$cg_input") or die "can't open $cg_input\n";

foreach (<INPUT>) {
	
	my @SNPS = <INPUT>;
	my @get_SNPS = split ( '\s', $_ ); 
	
	if (($get_SNPS[3] >= "88193855") && ($get_SNPS[3] <= "93193855")) {
		print OUT_XTR "@get_SNPS\n";
	}
}