#! /usr/bin/perl -w
use strict;
use warnings;
use Term::ANSIColor;

#-------------------------------------------------------------------------------
# What: This program will compute pi for all 26 females from frequency tables generated with 100 kb nonoverlapping windows.
#-------------------------------------------------------------------------------

my $usage = "fitered_compute_pi_all26_100kb_no.pl";

#------------------------------------------------

my $count = 0;

#my $count_number = 155; #1Mb non overlapping
my $count_number = 1553; #100kb non overlapping
#my $count_number = 1543; #1Mb overlapping
#my $count_number = 15518; #100kb overlapping

my $window_type = "nonoverlapping";
my $consensus_type = "no";
#my $window_type = "overlapping";
#my $consensus_type = "o";

#my $window_size = "1Mb_filtered";
my $window_size =  "100kb_filtered";

my $pop = "All26"; my $n = 52;
#my $pop = "9Afr"; my $n = 18;
#my $pop = "5Eur"; my $n = 10;

my $input_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_make_frequency_table/"."$window_type"."/"."$window_size"."/";
my $output_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/03_pi/filtered_pi/"."$window_type"."/"."$window_size"."/";

my $input_directory_2 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/03_consensus_files/02_called_sites/filtered_called_sites_"."$window_size"."/";
my $input_2 = "$input_directory_2"."filtered_"."$window_type"."_"."$window_size"."_"."$pop"."_females.txt";
open(SITES, "<$input_2") or die "can't open $input_2\n";
my @sites = <SITES>;
close(SITES);

my (@info, $info, $pi, $part, $major, $minor, $snps, $sampleSize, $sum);

my $output_file = "$output_dir"."filtered_pi."."$pop."."$window_size."."$consensus_type".".txt";
open(OUT, ">$output_file");

while($count < $count_number){
			
	chomp(@sites);
	my @site_info = split('\s', $sites[$count]);
	my $start = $site_info[1];
	my $end = $site_info[2];
	my $neutral_sites = $site_info[3];
		
	if ($neutral_sites > 0) {
		
		$pi = 0;
		$part = 0;
		$sum = 0;
	
		my $input_file = "$input_dir"."filtered_$pop"."_p_sites."."$count".".txt";

		open (CG, "<$input_file") or die "Cannot open $input_file:$!\n";
		while (my $cg = <CG>){
		
			if ($cg =~ /sites/){
			next;
			}
			else{
				chomp($cg);	#get rid of newline character
				@info =  split("\t", $cg);
			
				$major = 1 - $info[0];
				$minor = $info[0];
				$snps = $info[1];
			
				$part = $major*$minor*$snps;
			
				$sum = $sum + $part;
			}
		}

		 
		$sampleSize = $n/($n -1);
		$pi = 2*($sum*$sampleSize)/$neutral_sites;
		$pi = sprintf("%.8f", $pi);		
	
		print OUT "$start\t$end\t$pi\n";
	
		close(CG);
		$pi = 0;
		$part = 0;
		$sum = 0;

		$count++;
	}
	
	else {
		print OUT "$start\t$end\tNA\n";
		$count++;
	}
}