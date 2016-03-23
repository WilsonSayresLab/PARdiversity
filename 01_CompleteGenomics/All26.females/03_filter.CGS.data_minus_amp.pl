#!usr/bin/perl -w
use strict;
use warnings;

#----------------------------------------------------------------------------------
my $usage = "filter.CGS.data.All26.pl";
#this program will filter the CGS data for all 26 females with respect to microsattelites, repeated elements, genes ...etc.
#----------------------------------------------------------------------------------

my $placeholder = 0;

my $cg_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/01_CGS.All26.txt";
my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/";	

my $output_file = "$output_directory" . "filtered.CGS.All26_minus_amp.txt";
open (OUT, ">>$output_file");	

open (CG, "<$cg_input") or die "can't open $cg_input\n";
my @SNPs = <CG>;
close(CG); 

my $input_interval = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/filtered_chrX_interval_amp.txt";

open (INTERVAL, "$input_interval") or die "can't open $input_interval\n"; 
my $interval = <INTERVAL>;

my (@find_interval, $start, $end);

foreach my $interval (<INTERVAL>){
			
	@find_interval = split(/\t/, $interval);
	$start = $find_interval[1]; 
	$end = $find_interval[2];	
	
	my $switch = 1; 
	while (($switch == 1) && ($placeholder < 479832)) {		 
	
		my @get_SNPs = split('\s+', $SNPs[$placeholder]);
		my $position = $get_SNPs[3];
		
		print "$position\t$start\t$end\n";
		
		if (($position < $start) && ($position < $end)) {
			$placeholder++;
		}
		
		if (($position >= $start) && ($position <= $end)) {
			print OUT "@get_SNPs\n";
			$placeholder++;
		}
		if (($position > $start) && ($position > $end)) {
			$switch =! 1;	
		}
	}
}
close(INTERVAL);

