#! /usr/bin/perl -w
use strict;
use warnings;
use Term::ANSIColor;

#-------------------------------------------------------------------------------
# What: This program will compute the minor allele frequency from filtered CGS data and split the data into regions. 
#		
#-------------------------------------------------------------------------------

my $usage = "filtered_split_compute_minor_alleles_All26.pl";

#-------------------------------------------------------------------------------

my $population = "All26"; 

my $CGS_low1_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.low1.txt";
my $CGS_low2_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.low2.txt";
my $CGS_low3_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.low3.txt";
my $CGS_low4_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.low4.txt";
my $CGS_low5_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.low5.txt";
my $CGS_low6_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.low6.txt";
my $CGS_low7_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.low7.txt";
my $CGS_low8_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.low8.txt";

my $output_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/01_minor_alleles/filtered_split_compute_minor_alleles/";

my (@info, $info, $position);
my ($pop_ref, $pop_snp, $pop_minor);


my $output_file_low1 = "$output_dir"."$population"."_low1_minor_alleles.txt";
my $output_file_low2 = "$output_dir"."$population"."_low2_minor_alleles.txt";
my $output_file_low3 = "$output_dir"."$population"."_low3_minor_alleles.txt";
my $output_file_low4 = "$output_dir"."$population"."_low4_minor_alleles.txt";
my $output_file_low5 = "$output_dir"."$population"."_low5_minor_alleles.txt";
my $output_file_low6 = "$output_dir"."$population"."_low6_minor_alleles.txt";
my $output_file_low7 = "$output_dir"."$population"."_low7_minor_alleles.txt";
my $output_file_low8 = "$output_dir"."$population"."_low8_minor_alleles.txt";

open(OUT_low1, ">$output_file_low1");
open(OUT_low2, ">$output_file_low2");
open(OUT_low3, ">$output_file_low3");
open(OUT_low4, ">$output_file_low4");
open(OUT_low5, ">$output_file_low5");
open(OUT_low6, ">$output_file_low6");
open(OUT_low7, ">$output_file_low7");
open(OUT_low8, ">$output_file_low8");

open (CG_low1, "<$CGS_low1_input") or die "Cannot open $CGS_low1_input:$!\n";
open (CG_low2, "<$CGS_low2_input") or die "Cannot open $CGS_low2_input:$!\n";
open (CG_low3, "<$CGS_low3_input") or die "Cannot open $CGS_low3_input:$!\n";
open (CG_low4, "<$CGS_low4_input") or die "Cannot open $CGS_low4_input:$!\n";
open (CG_low5, "<$CGS_low5_input") or die "Cannot open $CGS_low5_input:$!\n";
open (CG_low6, "<$CGS_low6_input") or die "Cannot open $CGS_low6_input:$!\n";
open (CG_low7, "<$CGS_low7_input") or die "Cannot open $CGS_low7_input:$!\n";
open (CG_low8, "<$CGS_low8_input") or die "Cannot open $CGS_low8_input:$!\n";

while (my $cg_low1 = <CG_low1>){
		
	if ($cg_low1 =~ /^$|NA/) {next;}
	
	chomp($cg_low1);	#get rid of newline character
	@info =  split('\s', $cg_low1);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for low1 -----------------------------------------------------------------------

	if    ($info[4] == 1){ $pop_ref++; $pop_ref++;} #Puerto Rican
	elsif ($info[4] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[4] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[5] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[5] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[5] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[6] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[6] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[6] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[7] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[7] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[7] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[8] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[8] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[8] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[9] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[9] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[9] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[10] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[10] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[10] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[11] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[11] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[11] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[12] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[12] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[12] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[13] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[13] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[13] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[14] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[14] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[14] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[15] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[15] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[15] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[16] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[16] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[16] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[17] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[17] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[17] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[18] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[18] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[18] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[19] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[19] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[19] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[20] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[20] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[20] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[21] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[21] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[21] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[22] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[22] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[22] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[23] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[23] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[23] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[24] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[24] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[24] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[25] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[25] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[25] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[26] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[26] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[26] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[27] == 1){ $pop_ref++; $pop_ref++;} #Indian
	elsif ($info[27] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[27] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[28] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[28] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[28] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[29] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[29] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[29] == 3){ $pop_snp++; $pop_snp++;}
	
		
# COMPUTE MINOR ALLELE FREQUENCY (MIGHT BE REF OR SNP) ------------------------------------------

	if($pop_ref > $pop_snp){	$pop_minor = $pop_snp;}
	else{	$pop_minor = $pop_ref;}
			
	print OUT_low1 "$position\t$pop_minor\n";	
}
close(OUT_low1);
close(CG_low1);
print "low1 is done\n";
	
#low1 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------
	
	
while (my $cg_low2 = <CG_low2>){
		
	if ($cg_low2 =~ /^$|NA/) {next;}
	
	chomp($cg_low2);	#get rid of newline character
	@info =  split('\s', $cg_low2);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for low2 -----------------------------------------------------------------------

	if    ($info[4] == 1){ $pop_ref++; $pop_ref++;} #Puerto Rican
	elsif ($info[4] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[4] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[5] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[5] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[5] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[6] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[6] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[6] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[7] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[7] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[7] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[8] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[8] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[8] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[9] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[9] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[9] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[10] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[10] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[10] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[11] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[11] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[11] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[12] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[12] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[12] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[13] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[13] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[13] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[14] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[14] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[14] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[15] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[15] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[15] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[16] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[16] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[16] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[17] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[17] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[17] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[18] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[18] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[18] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[19] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[19] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[19] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[20] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[20] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[20] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[21] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[21] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[21] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[22] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[22] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[22] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[23] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[23] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[23] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[24] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[24] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[24] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[25] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[25] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[25] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[26] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[26] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[26] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[27] == 1){ $pop_ref++; $pop_ref++;} #Indian
	elsif ($info[27] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[27] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[28] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[28] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[28] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[29] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[29] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[29] == 3){ $pop_snp++; $pop_snp++;}
	
		
# COMPUTE MINOR ALLELE FREQUENCY (MIGHT BE REF OR SNP) ------------------------------------------

	if($pop_ref > $pop_snp){	$pop_minor = $pop_snp;}
	else{	$pop_minor = $pop_ref;}
			
	print OUT_low2 "$position\t$pop_minor\n";	
}
close(OUT_low2);
close(CG_low2);
print "low2 is done\n";
	
#low2 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_low3 = <CG_low3>){
		
	if ($cg_low3 =~ /^$|NA/) {next;}
	
	chomp($cg_low3);	#get rid of newline character
	@info =  split('\s', $cg_low3);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for low3 -----------------------------------------------------------------------

	if    ($info[4] == 1){ $pop_ref++; $pop_ref++;} #Puerto Rican
	elsif ($info[4] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[4] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[5] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[5] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[5] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[6] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[6] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[6] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[7] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[7] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[7] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[8] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[8] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[8] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[9] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[9] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[9] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[10] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[10] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[10] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[11] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[11] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[11] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[12] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[12] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[12] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[13] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[13] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[13] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[14] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[14] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[14] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[15] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[15] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[15] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[16] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[16] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[16] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[17] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[17] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[17] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[18] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[18] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[18] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[19] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[19] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[19] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[20] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[20] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[20] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[21] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[21] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[21] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[22] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[22] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[22] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[23] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[23] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[23] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[24] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[24] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[24] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[25] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[25] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[25] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[26] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[26] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[26] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[27] == 1){ $pop_ref++; $pop_ref++;} #Indian
	elsif ($info[27] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[27] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[28] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[28] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[28] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[29] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[29] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[29] == 3){ $pop_snp++; $pop_snp++;}
	
		
# COMPUTE MINOR ALLELE FREQUENCY (MIGHT BE REF OR SNP) ------------------------------------------

	if($pop_ref > $pop_snp){	$pop_minor = $pop_snp;}
	else{	$pop_minor = $pop_ref;}
			
	print OUT_low3 "$position\t$pop_minor\n";	
}
close(OUT_low3);
close(CG_low3);
print "low3 is done\n";
	
#low3 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_low4 = <CG_low4>){
		
	if ($cg_low4 =~ /^$|NA/) {next;}
	
	chomp($cg_low4);	#get rid of newline character
	@info =  split('\s', $cg_low4);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for low4 -----------------------------------------------------------------------

	if    ($info[4] == 1){ $pop_ref++; $pop_ref++;} #Puerto Rican
	elsif ($info[4] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[4] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[5] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[5] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[5] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[6] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[6] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[6] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[7] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[7] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[7] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[8] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[8] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[8] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[9] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[9] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[9] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[10] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[10] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[10] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[11] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[11] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[11] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[12] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[12] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[12] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[13] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[13] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[13] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[14] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[14] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[14] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[15] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[15] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[15] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[16] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[16] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[16] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[17] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[17] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[17] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[18] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[18] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[18] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[19] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[19] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[19] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[20] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[20] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[20] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[21] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[21] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[21] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[22] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[22] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[22] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[23] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[23] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[23] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[24] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[24] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[24] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[25] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[25] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[25] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[26] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[26] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[26] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[27] == 1){ $pop_ref++; $pop_ref++;} #Indian
	elsif ($info[27] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[27] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[28] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[28] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[28] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[29] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[29] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[29] == 3){ $pop_snp++; $pop_snp++;}
	
		
# COMPUTE MINOR ALLELE FREQUENCY (MIGHT BE REF OR SNP) ------------------------------------------

	if($pop_ref > $pop_snp){	$pop_minor = $pop_snp;}
	else{	$pop_minor = $pop_ref;}
			
	print OUT_low4 "$position\t$pop_minor\n";	
}
close(OUT_low4);
close(CG_low4);
print "low4 is done\n";
	
#low4 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_low5 = <CG_low5>){
		
	if ($cg_low5 =~ /^$|NA/) {next;}
	
	chomp($cg_low5);	#get rid of newline character
	@info =  split('\s', $cg_low5);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for low5 -----------------------------------------------------------------------

	if    ($info[4] == 1){ $pop_ref++; $pop_ref++;} #Puerto Rican
	elsif ($info[4] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[4] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[5] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[5] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[5] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[6] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[6] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[6] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[7] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[7] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[7] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[8] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[8] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[8] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[9] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[9] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[9] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[10] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[10] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[10] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[11] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[11] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[11] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[12] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[12] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[12] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[13] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[13] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[13] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[14] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[14] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[14] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[15] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[15] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[15] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[16] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[16] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[16] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[17] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[17] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[17] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[18] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[18] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[18] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[19] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[19] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[19] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[20] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[20] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[20] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[21] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[21] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[21] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[22] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[22] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[22] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[23] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[23] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[23] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[24] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[24] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[24] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[25] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[25] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[25] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[26] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[26] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[26] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[27] == 1){ $pop_ref++; $pop_ref++;} #Indian
	elsif ($info[27] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[27] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[28] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[28] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[28] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[29] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[29] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[29] == 3){ $pop_snp++; $pop_snp++;}
	
		
# COMPUTE MINOR ALLELE FREQUENCY (MIGHT BE REF OR SNP) ------------------------------------------

	if($pop_ref > $pop_snp){	$pop_minor = $pop_snp;}
	else{	$pop_minor = $pop_ref;}
			
	print OUT_low5 "$position\t$pop_minor\n";	
}
close(OUT_low5);
close(CG_low5);
print "low5 is done\n";
	
#low5 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_low6 = <CG_low6>){
		
	if ($cg_low6 =~ /^$|NA/) {next;}
	
	chomp($cg_low6);	#get rid of newline character
	@info =  split('\s', $cg_low6);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for low6 -----------------------------------------------------------------------

	if    ($info[4] == 1){ $pop_ref++; $pop_ref++;} #Puerto Rican
	elsif ($info[4] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[4] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[5] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[5] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[5] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[6] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[6] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[6] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[7] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[7] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[7] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[8] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[8] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[8] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[9] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[9] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[9] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[10] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[10] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[10] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[11] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[11] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[11] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[12] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[12] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[12] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[13] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[13] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[13] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[14] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[14] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[14] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[15] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[15] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[15] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[16] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[16] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[16] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[17] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[17] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[17] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[18] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[18] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[18] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[19] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[19] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[19] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[20] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[20] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[20] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[21] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[21] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[21] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[22] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[22] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[22] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[23] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[23] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[23] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[24] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[24] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[24] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[25] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[25] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[25] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[26] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[26] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[26] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[27] == 1){ $pop_ref++; $pop_ref++;} #Indian
	elsif ($info[27] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[27] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[28] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[28] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[28] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[29] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[29] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[29] == 3){ $pop_snp++; $pop_snp++;}
	
		
# COMPUTE MINOR ALLELE FREQUENCY (MIGHT BE REF OR SNP) ------------------------------------------

	if($pop_ref > $pop_snp){	$pop_minor = $pop_snp;}
	else{	$pop_minor = $pop_ref;}
			
	print OUT_low6 "$position\t$pop_minor\n";	
}
close(OUT_low6);
close(CG_low6);
print "low6 is done\n";
	
#low6 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_low7 = <CG_low7>){
		
	if ($cg_low7 =~ /^$|NA/) {next;}
	
	chomp($cg_low7);	#get rid of newline character
	@info =  split('\s', $cg_low7);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for low7 -----------------------------------------------------------------------

	if    ($info[4] == 1){ $pop_ref++; $pop_ref++;} #Puerto Rican
	elsif ($info[4] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[4] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[5] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[5] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[5] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[6] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[6] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[6] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[7] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[7] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[7] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[8] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[8] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[8] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[9] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[9] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[9] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[10] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[10] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[10] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[11] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[11] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[11] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[12] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[12] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[12] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[13] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[13] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[13] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[14] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[14] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[14] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[15] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[15] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[15] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[16] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[16] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[16] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[17] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[17] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[17] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[18] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[18] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[18] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[19] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[19] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[19] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[20] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[20] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[20] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[21] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[21] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[21] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[22] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[22] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[22] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[23] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[23] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[23] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[24] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[24] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[24] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[25] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[25] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[25] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[26] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[26] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[26] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[27] == 1){ $pop_ref++; $pop_ref++;} #Indian
	elsif ($info[27] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[27] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[28] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[28] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[28] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[29] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[29] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[29] == 3){ $pop_snp++; $pop_snp++;}
	
		
# COMPUTE MINOR ALLELE FREQUENCY (MIGHT BE REF OR SNP) ------------------------------------------

	if($pop_ref > $pop_snp){	$pop_minor = $pop_snp;}
	else{	$pop_minor = $pop_ref;}
			
	print OUT_low7 "$position\t$pop_minor\n";	
}
close(OUT_low7);
close(CG_low7);
print "low7 is done\n";
	
#low7 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_low8 = <CG_low8>){
		
	if ($cg_low8 =~ /^$|NA/) {next;}
	
	chomp($cg_low8);	#get rid of newline character
	@info =  split('\s', $cg_low8);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for low8 -----------------------------------------------------------------------

	if    ($info[4] == 1){ $pop_ref++; $pop_ref++;} #Puerto Rican
	elsif ($info[4] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[4] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[5] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[5] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[5] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[6] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[6] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[6] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[7] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[7] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[7] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[8] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[8] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[8] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[9] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[9] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[9] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[10] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[10] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[10] == 3){ $pop_snp++; $pop_snp++;}

	if    ($info[11] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[11] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[11] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[12] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[12] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[12] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[13] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[13] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[13] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[14] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[14] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[14] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[15] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[15] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[15] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[16] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[16] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[16] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[17] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[17] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[17] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[18] == 1){ $pop_ref++; $pop_ref++;} #Asian
	elsif ($info[18] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[18] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[19] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[19] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[19] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[20] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[20] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[20] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[21] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[21] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[21] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[22] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[22] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[22] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[23] == 1){ $pop_ref++; $pop_ref++;} #Mexican
	elsif ($info[23] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[23] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[24] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[24] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[24] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[25] == 1){ $pop_ref++; $pop_ref++;} #AfricanDescent
	elsif ($info[25] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[25] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[26] == 1){ $pop_ref++; $pop_ref++;} #European
	elsif ($info[26] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[26] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[27] == 1){ $pop_ref++; $pop_ref++;} #Indian
	elsif ($info[27] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[27] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[28] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[28] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[28] == 3){ $pop_snp++; $pop_snp++;}
	
	if    ($info[29] == 1){ $pop_ref++; $pop_ref++;} #African
	elsif ($info[29] == 2){ $pop_ref++; $pop_snp++;}
	elsif ($info[29] == 3){ $pop_snp++; $pop_snp++;}
	
		
# COMPUTE MINOR ALLELE FREQUENCY (MIGHT BE REF OR SNP) ------------------------------------------

	if($pop_ref > $pop_snp){	$pop_minor = $pop_snp;}
	else{	$pop_minor = $pop_ref;}
			
	print OUT_low8 "$position\t$pop_minor\n";	
}
close(OUT_low8);
close(CG_low8);
print "low8 is done\n";
	
#low8 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------