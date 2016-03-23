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

my $CGS_amp1_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.amp1.txt";
my $CGS_amp2_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.amp2.txt";
my $CGS_amp3_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.amp3.txt";
my $CGS_amp4_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.amp4.txt";
my $CGS_amp5_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.amp5.txt";
my $CGS_amp6_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.amp6.txt";
my $CGS_amp7_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.amp7.txt";
my $CGS_amp8_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.amp8.txt";
my $CGS_amp9_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.amp9.txt";
my $CGS_amp10_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.amp10.txt";
my $CGS_amp11_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.amp11.txt";
my $CGS_amp12_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.amp12.txt";

my $output_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/01_minor_alleles/filtered_split_compute_minor_alleles/";

my (@info, $info, $position);
my ($pop_ref, $pop_snp, $pop_minor);


my $output_file_amp1 = "$output_dir"."$population"."_amp1_minor_alleles.txt";
my $output_file_amp2 = "$output_dir"."$population"."_amp2_minor_alleles.txt";
my $output_file_amp3 = "$output_dir"."$population"."_amp3_minor_alleles.txt";
my $output_file_amp4 = "$output_dir"."$population"."_amp4_minor_alleles.txt";
my $output_file_amp5 = "$output_dir"."$population"."_amp5_minor_alleles.txt";
my $output_file_amp6 = "$output_dir"."$population"."_amp6_minor_alleles.txt";
my $output_file_amp7 = "$output_dir"."$population"."_amp7_minor_alleles.txt";
my $output_file_amp8 = "$output_dir"."$population"."_amp8_minor_alleles.txt";
my $output_file_amp9 = "$output_dir"."$population"."_amp9_minor_alleles.txt";
my $output_file_amp10 = "$output_dir"."$population"."_amp10_minor_alleles.txt";
my $output_file_amp11 = "$output_dir"."$population"."_amp11_minor_alleles.txt";
my $output_file_amp12 = "$output_dir"."$population"."_amp12_minor_alleles.txt";

open(OUT_amp1, ">$output_file_amp1");
open(OUT_amp2, ">$output_file_amp2");
open(OUT_amp3, ">$output_file_amp3");
open(OUT_amp4, ">$output_file_amp4");
open(OUT_amp5, ">$output_file_amp5");
open(OUT_amp6, ">$output_file_amp6");
open(OUT_amp7, ">$output_file_amp7");
open(OUT_amp8, ">$output_file_amp8");
open(OUT_amp9, ">$output_file_amp9");
open(OUT_amp10, ">$output_file_amp10");
open(OUT_amp11, ">$output_file_amp11");
open(OUT_amp12, ">$output_file_amp12");

open (CG_amp1, "<$CGS_amp1_input") or die "Cannot open $CGS_amp1_input:$!\n";
open (CG_amp2, "<$CGS_amp2_input") or die "Cannot open $CGS_amp2_input:$!\n";
open (CG_amp3, "<$CGS_amp3_input") or die "Cannot open $CGS_amp3_input:$!\n";
open (CG_amp4, "<$CGS_amp4_input") or die "Cannot open $CGS_amp4_input:$!\n";
open (CG_amp5, "<$CGS_amp5_input") or die "Cannot open $CGS_amp5_input:$!\n";
open (CG_amp6, "<$CGS_amp6_input") or die "Cannot open $CGS_amp6_input:$!\n";
open (CG_amp7, "<$CGS_amp7_input") or die "Cannot open $CGS_amp7_input:$!\n";
open (CG_amp8, "<$CGS_amp8_input") or die "Cannot open $CGS_amp8_input:$!\n";
open (CG_amp9, "<$CGS_amp9_input") or die "Cannot open $CGS_amp9_input:$!\n";
open (CG_amp10, "<$CGS_amp10_input") or die "Cannot open $CGS_amp10_input:$!\n";
open (CG_amp11, "<$CGS_amp11_input") or die "Cannot open $CGS_amp11_input:$!\n";
open (CG_amp12, "<$CGS_amp12_input") or die "Cannot open $CGS_amp12_input:$!\n";

while (my $cg_amp1 = <CG_amp1>){
		
	if ($cg_amp1 =~ /^$|NA/) {next;}
	
	chomp($cg_amp1);	#get rid of newline character
	@info =  split('\s', $cg_amp1);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for amp1 -----------------------------------------------------------------------

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
			
	print OUT_amp1 "$position\t$pop_minor\n";	
}
close(OUT_amp1);
close(CG_amp1);
print "amp1 is done\n";
	
#amp1 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------
	
	
while (my $cg_amp2 = <CG_amp2>){
		
	if ($cg_amp2 =~ /^$|NA/) {next;}
	
	chomp($cg_amp2);	#get rid of newline character
	@info =  split('\s', $cg_amp2);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for amp2 -----------------------------------------------------------------------

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
			
	print OUT_amp2 "$position\t$pop_minor\n";	
}
close(OUT_amp2);
close(CG_amp2);
print "amp2 is done\n";
	
#amp2 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_amp3 = <CG_amp3>){
		
	if ($cg_amp3 =~ /^$|NA/) {next;}
	
	chomp($cg_amp3);	#get rid of newline character
	@info =  split('\s', $cg_amp3);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for amp3 -----------------------------------------------------------------------

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
			
	print OUT_amp3 "$position\t$pop_minor\n";	
}
close(OUT_amp3);
close(CG_amp3);
print "amp3 is done\n";
	
#amp3 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_amp4 = <CG_amp4>){
		
	if ($cg_amp4 =~ /^$|NA/) {next;}
	
	chomp($cg_amp4);	#get rid of newline character
	@info =  split('\s', $cg_amp4);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for amp4 -----------------------------------------------------------------------

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
			
	print OUT_amp4 "$position\t$pop_minor\n";	
}
close(OUT_amp4);
close(CG_amp4);
print "amp4 is done\n";
	
#amp4 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_amp5 = <CG_amp5>){
		
	if ($cg_amp5 =~ /^$|NA/) {next;}
	
	chomp($cg_amp5);	#get rid of newline character
	@info =  split('\s', $cg_amp5);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for amp5 -----------------------------------------------------------------------

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
			
	print OUT_amp5 "$position\t$pop_minor\n";	
}
close(OUT_amp5);
close(CG_amp5);
print "amp5 is done\n";
	
#amp5 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_amp6 = <CG_amp6>){
		
	if ($cg_amp6 =~ /^$|NA/) {next;}
	
	chomp($cg_amp6);	#get rid of newline character
	@info =  split('\s', $cg_amp6);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for amp6 -----------------------------------------------------------------------

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
			
	print OUT_amp6 "$position\t$pop_minor\n";	
}
close(OUT_amp6);
close(CG_amp6);
print "amp6 is done\n";
	
#amp6 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_amp7 = <CG_amp7>){
		
	if ($cg_amp7 =~ /^$|NA/) {next;}
	
	chomp($cg_amp7);	#get rid of newline character
	@info =  split('\s', $cg_amp7);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for amp7 -----------------------------------------------------------------------

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
			
	print OUT_amp7 "$position\t$pop_minor\n";	
}
close(OUT_amp7);
close(CG_amp7);
print "amp7 is done\n";
	
#amp7 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_amp8 = <CG_amp8>){
		
	if ($cg_amp8 =~ /^$|NA/) {next;}
	
	chomp($cg_amp8);	#get rid of newline character
	@info =  split('\s', $cg_amp8);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for amp8 -----------------------------------------------------------------------

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
			
	print OUT_amp8 "$position\t$pop_minor\n";	
}
close(OUT_amp8);
close(CG_amp8);
print "amp8 is done\n";
	
#amp8 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_amp9 = <CG_amp9>){
		
	if ($cg_amp9 =~ /^$|NA/) {next;}
	
	chomp($cg_amp9);	#get rid of newline character
	@info =  split('\s', $cg_amp9);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for amp9 -----------------------------------------------------------------------

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
			
	print OUT_amp9 "$position\t$pop_minor\n";	
}
close(OUT_amp9);
close(CG_amp9);
print "amp9 is done\n";
	
#amp9 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_amp10 = <CG_amp10>){
		
	if ($cg_amp10 =~ /^$|NA/) {next;}
	
	chomp($cg_amp10);	#get rid of newline character
	@info =  split('\s', $cg_amp10);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for amp10 -----------------------------------------------------------------------

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
			
	print OUT_amp10 "$position\t$pop_minor\n";	
}
close(OUT_amp10);
close(CG_amp10);
print "amp10 is done\n";
	
#amp10 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_amp11 = <CG_amp11>){
		
	if ($cg_amp11 =~ /^$|NA/) {next;}
	
	chomp($cg_amp11);	#get rid of newline character
	@info =  split('\s', $cg_amp11);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for amp11 -----------------------------------------------------------------------

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
			
	print OUT_amp11 "$position\t$pop_minor\n";	
}
close(OUT_amp11);
close(CG_amp11);
print "amp11 is done\n";
	
#amp11 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------


while (my $cg_amp12 = <CG_amp12>){
		
	if ($cg_amp12 =~ /^$|NA/) {next;}
	
	chomp($cg_amp12);	#get rid of newline character
	@info =  split('\s', $cg_amp12);
	
	$position = $info[3];

	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS for amp12 -----------------------------------------------------------------------

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
			
	print OUT_amp12 "$position\t$pop_minor\n";	
}
close(OUT_amp12);
close(CG_amp12);
print "amp12 is done\n";
	
#amp12 minor alleles are counted and recorded -------------------------------------------------------------------------------------------------