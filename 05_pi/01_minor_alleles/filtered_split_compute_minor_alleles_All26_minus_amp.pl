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

my $CGS_nonPAR_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/split.CGS.All26.nonPAR_minus_amp.txt";

my $output_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/01_minor_alleles/filtered_split_compute_minor_alleles/";

my (@info, $info, $position);
my ($pop_ref, $pop_snp, $pop_minor);

my $output_file_nonPAR = "$output_dir"."$population"."_nonPAR_minor_alleles_minus_amp.txt";

open(OUT_nonPAR, ">$output_file_nonPAR");

open (CG_nonPAR, "<$CGS_nonPAR_input") or die "Cannot open $CGS_nonPAR_input:$!\n";


	
while (my $cg_nonPAR = <CG_nonPAR>){
	
	if ($cg_nonPAR =~ /^$|NA/) {next;}
	
	chomp($cg_nonPAR);	#get rid of newline character
	@info =  split('\s', $cg_nonPAR);
	
	$position = $info[3];
	$pop_ref = 0;
	$pop_snp = 0;

#------- Compute SNPS nonPAR -----------------------------------------------------------------------

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
		
	print OUT_nonPAR "$position\t$pop_minor\n";	
}
close(OUT_nonPAR);
close(CG_nonPAR);
print "nonPAR is done\n";
