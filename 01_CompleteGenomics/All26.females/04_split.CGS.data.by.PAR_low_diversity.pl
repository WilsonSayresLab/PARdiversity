#!usr/bin/perl -w
use strict;
use warnings;

#----------------------------------------------------------------------------------
my $usage = "split.CGS.data.by.PAR.pl";
#this program will split the filtered CGS data into 3 regions
#----------------------------------------------------------------------------------

#my $c = 0; 

my $cg_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/filtered.CGS.All26_original.txt";		
my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/";

my $output_file_low1 = "$output_directory"."split.CGS.All26.low1.txt";
my $output_file_low2 = "$output_directory"."split.CGS.All26.low2.txt";
my $output_file_low3 = "$output_directory"."split.CGS.All26.low3.txt";
my $output_file_low4 = "$output_directory"."split.CGS.All26.low4.txt";
my $output_file_low5 = "$output_directory"."split.CGS.All26.low5.txt";
my $output_file_low6 = "$output_directory"."split.CGS.All26.low6.txt";
my $output_file_low7 = "$output_directory"."split.CGS.All26.low7.txt";
my $output_file_low8 = "$output_directory"."split.CGS.All26.low8.txt";

open ( OUT_low1, ">$output_file_low1" ) or die "can't open\n";
open ( OUT_low2, ">$output_file_low2" ) or die "can't open\n";
open ( OUT_low3, ">$output_file_low3" ) or die "can't open\n";
open ( OUT_low4, ">$output_file_low4" ) or die "can't open\n";
open ( OUT_low5, ">$output_file_low5" ) or die "can't open\n";
open ( OUT_low6, ">$output_file_low6" ) or die "can't open\n";
open ( OUT_low7, ">$output_file_low7" ) or die "can't open\n";
open ( OUT_low8, ">$output_file_low8" ) or die "can't open\n";

open (INPUT, "<$cg_input") or die "can't open $cg_input\n";

foreach (<INPUT>) {
	
	my @SNPS = <INPUT>;
	my @get_SNPS = split ( '\s', $_ ); 
	
	if (($get_SNPS[3] >= "10241177") && ($get_SNPS[3] <= "12619185")) {
		print OUT_low1 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "16946047") && ($get_SNPS[3] <= "18747389")) {
		print OUT_low2 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "19303480") && ($get_SNPS[3] <= "22198160")) {
		print OUT_low3 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "38344992") && ($get_SNPS[3] <= "41272675")) {
		print OUT_low4 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "45930478") && ($get_SNPS[3] <= "77954462")) {
		print OUT_low5 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "99459295") && ($get_SNPS[3] <= "111145964")) {
		print OUT_low6 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "128232540") && ($get_SNPS[3] <= "136796526")) {
		print OUT_low7 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "151519514") && ($get_SNPS[3] <= "155156362")) {
		print OUT_low8 "@get_SNPS\n";
	}
	
}