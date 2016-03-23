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

my $output_file_amp1 = "$output_directory"."split.CGS.All26.amp1.txt";
my $output_file_amp2 = "$output_directory"."split.CGS.All26.amp2.txt";
my $output_file_amp3 = "$output_directory"."split.CGS.All26.amp3.txt";
my $output_file_amp4 = "$output_directory"."split.CGS.All26.amp4.txt";
my $output_file_amp5 = "$output_directory"."split.CGS.All26.amp5.txt";
my $output_file_amp6 = "$output_directory"."split.CGS.All26.amp6.txt";
my $output_file_amp7 = "$output_directory"."split.CGS.All26.amp7.txt";
my $output_file_amp8 = "$output_directory"."split.CGS.All26.amp8.txt";
my $output_file_amp9 = "$output_directory"."split.CGS.All26.amp9.txt";
my $output_file_amp10 = "$output_directory"."split.CGS.All26.amp10.txt";
my $output_file_amp11 = "$output_directory"."split.CGS.All26.amp11.txt";
my $output_file_amp12 = "$output_directory"."split.CGS.All26.amp12.txt";

open ( OUT_amp1, ">$output_file_amp1" ) or die "can't open\n";
open ( OUT_amp2, ">$output_file_amp2" ) or die "can't open\n";
open ( OUT_amp3, ">$output_file_amp3" ) or die "can't open\n";
open ( OUT_amp4, ">$output_file_amp4" ) or die "can't open\n";
open ( OUT_amp5, ">$output_file_amp5" ) or die "can't open\n";
open ( OUT_amp6, ">$output_file_amp6" ) or die "can't open\n";
open ( OUT_amp7, ">$output_file_amp7" ) or die "can't open\n";
open ( OUT_amp8, ">$output_file_amp8" ) or die "can't open\n";
open ( OUT_amp9, ">$output_file_amp9" ) or die "can't open\n";
open ( OUT_amp10, ">$output_file_amp10" ) or die "can't open\n";
open ( OUT_amp11, ">$output_file_amp11" ) or die "can't open\n";
open ( OUT_amp12, ">$output_file_amp12" ) or die "can't open\n";

open (INPUT, "<$cg_input") or die "can't open $cg_input\n";

foreach (<INPUT>) {
	
	my @SNPS = <INPUT>;
	my @get_SNPS = split ( '\s', $_ ); 
	
	if (($get_SNPS[3] >= "48202745") && ($get_SNPS[3] <= "48292983")) {
		print OUT_amp1 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "48976199") && ($get_SNPS[3] <= "49062381")) {
		print OUT_amp2 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "51395467") && ($get_SNPS[3] <= "51492862")) {
		print OUT_amp3 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "51775560") && ($get_SNPS[3] <= "51966529")) {
		print OUT_amp4 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "52518132") && ($get_SNPS[3] <= "53027386")) {
		print OUT_amp5 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "55464117") && ($get_SNPS[3] <= "55574172")) {
		print OUT_amp6 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "62335733") && ($get_SNPS[3] <= "62495350")) {
		print OUT_amp7 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "70894117") && ($get_SNPS[3] <= "71055682")) {
		print OUT_amp8 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "71941159") && ($get_SNPS[3] <= "72325075")) {
		print OUT_amp9 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "100818723") && ($get_SNPS[3] <= "100903977")) {
		print OUT_amp10 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "101435778") && ($get_SNPS[3] <= "101774391")) {
		print OUT_amp11 "@get_SNPS\n";
	}
	
	if (($get_SNPS[3] >= "103195105") && ($get_SNPS[3] <= "103362341")) {
		print OUT_amp12 "@get_SNPS\n";
	}
}