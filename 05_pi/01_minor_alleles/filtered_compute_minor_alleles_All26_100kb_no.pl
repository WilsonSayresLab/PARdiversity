#! /usr/bin/perl -w
use strict;
use warnings;
use Term::ANSIColor;

#-------------------------------------------------------------------------------
# What: This program will compute the minor allele frequency from filtered CGS data
#		for All26 Females, in 100 kb nonoverlapping windows. 
#-------------------------------------------------------------------------------

my $usage = "compute_minor_alleles_all26_100kb_no.pl";

#-------------------------------------------------------------------------------

#my $count_number = 155; #1Mb non overlapping
my $count_number = 1553; #100kb non overlapping
#my $count_number = 1543; #1Mb overlapping
#my $count_number = 15518; #100kb overlapping

#my $window_size = "1Mb_filtered";
my $window_size = "100kb_filtered";

my $window_type = "nonoverlapping";
#my $window_type = "overlapping";

my $pop = "All26";

my $input_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/04_temps/"."$window_type/"."$window_size/";
my $output_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/01_minor_alleles/filtered_compute_minor_alleles/"."$window_type/"."$window_size/";

my $count = 0;
my (@info, $info, $position);
my ($pop_ref, $pop_snp, $pop_minor);

while($count < $count_number){

	my $output_file = "$output_dir"."filtered_$pop"."_minor_alleles."."$count".".txt";
	open(OUT, ">$output_file");

	my $input_file = "$input_dir"."temp_file_". "$count."."txt";
	
	open (CG, "<$input_file") or die "Cannot open $input_file:$!\n";
	while (my $cg = <CG>){
		
		if ($cg =~ /^$|NA/) {
			next;
		}
		
		chomp($cg);	#get rid of newline character
		@info =  split(" ", $cg);
		
		$position = $info[3];

		$pop_ref = 0;
		$pop_snp = 0;

#------- Compute SNPS -----------------------------------------------------------------------

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
			
		print OUT "$position\t$pop_minor\n";	
	}
	close(OUT);
	close(CG);
	print "$pop $count is done\n";
	$count++;
}