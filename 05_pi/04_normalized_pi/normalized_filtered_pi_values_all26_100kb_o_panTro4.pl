#!usr/bin/perl -w 
use strict; 
use warnings;

#-------------------------------------

my $usage = "normalize filtered values of pi by per window divergence between humans and chimps or between humans and macaques";

#-------------------------------------

my $count = 0; 

#my $count_number = 155; #1Mb non overlapping  
#my $count_number = 1553; #100kb non overlapping
#my $count_number = 1543; #1Mb overlapping
my $count_number = 15518; #100kb overlapping

#my $window_size = "1Mb_filtered";
my $window_size = "100kb_filtered";

#my $window_type = "nonoverlapping";
#my $consensus_type = "no";
my $window_type = "overlapping";
my $consensus_type = "o";

my $genome = "panTro4";# Chimpanzee
#my $genome = "RheMac3"; # Rhesus Macaque

my $pop = "All26";
#my $pop = "9Afr";
#my $pop = "5Eur";

my $pi_file = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/03_pi/filtered_pi/"."$window_type"."/"."$window_size"."/"."filtered_pi."."$pop."."$window_size."."$consensus_type".".txt";
open ( PI, "<$pi_file" ) or die "can't open $pi_file\n";
my @pi_info = <PI>; 

my $divergence_file = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/filtered_subs_rates_"."$window_size"."_"."$consensus_type"."_"."$genome".".txt";
open ( DIVERGENCE, "<$divergence_file") or die "can't open $divergence_file\n"; 
my @divergence_info = <DIVERGENCE>; 

my $output_file = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/04_normalized_pi/normalized_filtered_pi/"."$window_type"."/"."$window_size"."/"."$pop."."$window_size."."$consensus_type".".$genome".".txt";
open ( OUT, ">$output_file" );

while ($count < $count_number) {
	 
		
	chomp @pi_info;
	my @get_pi = split('\s', $pi_info[$count]); 
	my $start = $get_pi[0];
	my $end = $get_pi[1];
	my $pi = $get_pi[2];
	
	chomp @divergence_info;
	my @get_divergence = split('\s', $divergence_info[$count]);
	my $p = $get_divergence[5];
	
	if ($p eq "NA") {
		print OUT "$start\t$end\tNA\n";
		$count++;
	}
	elsif (($p > 0) && ($pi > 0)) {
		my $normalized_pi = $pi / $p;  
		print OUT "$start\t$end\t$normalized_pi\n";
		$count++;
	}
	
	else { 									#redundant but left as part of original file
		print OUT "$start\t$end\tNA\n";
		$count++;
	}
}