#!/usr/bin/perl -w
use strict;

#-------------------------------------------------------------------------------
# What: Determine how many called sites are in a given interval #-------------------------------------------------------------------------------
my $usage = "filtered_non_overlapping_1Mb_all26_females.pl\n"; 
#input_dir = /Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes/consensus_files/mask_files/
#-------------------------------------------------------------------------------

my $population = "all26_females";

my $input_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/01_mask_files/filtered_mask_files/";
my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/02_called_sites/filtered_called_sites_2.7Mb_filtered/";	

my $output_file = "$output_directory" . "filtered_nonoverlapping_2.7Mb_filtered_"."$population".".txt";
open (OUT, ">>$output_file") or die "can't open $output_file\n";

#print OUT "chr\tstart\tend\tfiltered_sites_called_inCGS\n";


my $chr = 23;

while($chr < 24) {

	my $input_file = "$input_dir"."filtered.mask."."$population".".chr."."$chr".".txt";

	my $intervals = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/chrX_2.7Mbwindow_nonoverlapping.txt";
	

	open(INTERVAL, "<$intervals") or die "can't open $intervals\n";
	open(CGS, "<$input_file") or die "can't open $input_file\n";
	my $cgs = <CGS>;
	
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
		#print OUT "$total_filtered\n";
	}
	$chr++;
	close(CGS);

}