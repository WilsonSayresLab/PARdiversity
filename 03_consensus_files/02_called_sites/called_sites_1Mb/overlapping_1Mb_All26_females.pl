#!/usr/bin/perl -w
use strict;

#-------------------------------------------------------------------------------
# What: Determine how many called sites are in a given interval #-------------------------------------------------------------------------------
my $usage = "overlapping_1Mb_all26_females.pl\n"; 
#input_dir = /Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes/consensus_files/mask_files/
#-------------------------------------------------------------------------------

my $input_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/01_mask_files/";
my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/02_called_sites/called_sites_1Mb/";	

my $output_file = "$output_directory" . "overlapping_1Mb_All26_females.txt";
open (OUT, ">>$output_file") or die "can't open $output_file\n";

#print OUT "chr\tstart\tend\tsites_called_inCGS\n";


my $chr = 23;


while($chr < 24) {

	my $input_file = "$input_dir"."mask.all26_females.chr."."$chr".".txt";
#	my $input_file = "$input_dir"."mask.9Afr_females.chr."."$chr".".txt";
#	my $input_file = "$input_dir"."mask.5Eur_females.chr."."$chr".".txt";

#	my $intervals = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/chrX_1Mbwindow_nonoverlapping.txt";
	my $intervals = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/chrX_1Mbwindow_overlapping100kb.txt";
#	my $intervals = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/chrX_100kbwindow_nonoverlapping.txt";
#	my $intervals = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/chrX_100kbwindow_overlapping10kb.txt";
	

	open(INTERVAL, "<$intervals") or die "can't open $intervals\n";
	open(CGS, "<$input_file") or die "can't open $input_file\n";
	my $cgs = <CGS>;
	close(CGS);
	
##INTERVAL will be the window
##CGS will be the mask file of the specific population	
	
	my $total_length = 0;
	my $total_filtered = 0;
	while (my $interval = <INTERVAL>){
		
		chomp($interval);
		my @find_interval = split(/\t/, $interval);
		my $start = $find_interval[0];
		my $end = $find_interval[1];
		my $filtered = 0; 

		my $length = $end - $start;
		$total_length = $total_length + $length;

		my $substring = substr($cgs, $start, $length);
		
		my @array = split(//,$substring);
		
		foreach my $line (@array){
			if($line =~ /0/){
				$filtered++;
				$total_filtered++;
			}
			
		}
		print OUT "chr$chr\t$start\t$end\t$filtered\n";
	}
	$chr++
}