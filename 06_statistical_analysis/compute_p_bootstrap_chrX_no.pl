#! /usr/bin/perl -w
use strict;
use warnings;
use Term::ANSIColor;
use List::Util qw(first max maxstr min minstr reduce shuffle sum);

#-------------------------------------------------------------------------------
# What: This program will read through a directory of bootstrap samples, 
#		compute the weighted averages and then compute the 95% CI
#
# Note: The input file should not have any headers and should be formatted:
#
#		start	end	pi
#
# Need: Define PAR1/PAR2/XTR start & end
#		Define number of replicates
#-------------------------------------------------------------------------------

my $usage = "usage = perl compute_95_bootstrap_chrX.pl [input_file]\n";
die $usage unless @ARGV == 1; 

# -------------------------------------
# Define X chromosome boundaries based on the windows - comment out sections as needed.
# This is for non overlapping windows of 100,000kb
# -------------------------------------
my $PAR1_start = 0;
my $PAR1_end = 27;

my $XTR_start = 468;
my $XTR_end = 518;

my $PAR2_start = 901;
my $PAR2_end = -1; 
# -------------------------------------
my $replicates = 10000;
# -------------------------------------

my $input_file = "$ARGV[0]";
open(FILE, "<$input_file") or die "Cannot open $input_file :$!";
my @line = <FILE>;
close(FILE);

my @filename = split(/.txt/, $input_file);

my $outfile = "$filename[0]"."_p.txt";
open(OUT, ">$outfile") or die "Cannot open $outfile :$!";

my $length = @line;	#total number of sites in the file

# Assign values to the different regions of the X chromosome, by window
my @PAR1;
my @XTR;
my @PAR2;
my @nonPAR;

my $c = 0;
foreach my $line (@line){

	my @array = split(/\t/,$line);
	
	my $start = $array[0];
	my $end = $array[1];
	my $pi = $array[2];
	
	#for PAR1
	if ($c <= $PAR1_end){
	push(@PAR1, $array[2]);
	$c++;
	}
	#for PAR2
	elsif ($c >= $PAR2_start){
	push(@PAR2, $array[2]);
	$c++;	
	}
	#for XTR
	elsif (($c>=$XTR_start)&&($c<=$XTR_end)){
	push(@XTR, $array[2]);
	$c++;
	}
	#for nonPAR
	else{
	push(@nonPAR, $array[2]);
	$c++;	
	}
}

# Compute mean and median of observed values
my $sum_PAR1 = 0;
my $sum_PAR2 = 0;
my $sum_XTR = 0;
my $sum_nonPAR = 0;

my $length_PAR1;
my $length_PAR2;
my $length_XTR;
my $length_nonPAR;

@PAR1 = sort(@PAR1);
@PAR2 = sort(@PAR2);
@XTR = sort(@XTR);
@nonPAR = sort(@nonPAR);

foreach my $PAR1 (@PAR1){
	if ($PAR1 !~ "NA"){
		$sum_PAR1 = $sum_PAR1 + $PAR1;
		$length_PAR1++;
	}
}
foreach my $PAR2 (@PAR2){
	if ($PAR2 !~ "NA"){
		$sum_PAR2 = $sum_PAR2 + $PAR2;
		$length_PAR2++;
	}
}
foreach my $XTR (@XTR){
	if ($XTR !~ "NA"){
		$sum_XTR = $sum_XTR + $XTR;
		$length_XTR++;
	}
}
foreach my $nonPAR (@nonPAR){
	if ($nonPAR !~ "NA"){
		$sum_nonPAR = $sum_nonPAR + $nonPAR;
		$length_nonPAR++;
	}
}

#compute the mean
my $mean_observed_PAR1 = $sum_PAR1/$length_PAR1;
my $mean_observed_PAR2 = $sum_PAR2/$length_PAR2;
my $mean_observed_XTR = $sum_XTR/$length_XTR;
my $mean_observed_nonPAR = $sum_nonPAR/$length_nonPAR;

# sanity check for means
print "PAR1 mean:\t$mean_observed_PAR1\n";
print "PAR2 mean:\t$mean_observed_PAR2\n";
print "XTR mean:\t$mean_observed_XTR\n";
print "nonPAR mean:\t$mean_observed_nonPAR\n";

#compute the median - to come


# now compute the bootstrap replicates
#clear the arrays and the sequence counter for the next bootstrap replicate
@PAR1 = ();
@PAR2 = ();
@XTR = ();
@nonPAR = ();

#define the bootstrap arrays
my @b_PAR1;
my @b_PAR2;
my @b_XTR;
my @b_nonPAR;

my $mean_PAR2_NA_count = 0;

my $r = 0;
while ($r < $replicates){

	@line = shuffle(@line);
	
	$c = 0;
	foreach my $line (@line){

		my @array = split(/\t/,$line);
	
		my $start = $array[0];
		my $end = $array[1];
		my $pi = $array[2];
	
		#for PAR1
		if ($c <= $PAR1_end){
		push(@PAR1, $pi);
		$c++;
		}
		#for PAR2
		elsif ($c >= $PAR2_start){
		push(@PAR2, $pi);
		$c++;	
		}
		#for XTR
		elsif (($c>=$XTR_start)&&($c<=$XTR_end)){
		push(@XTR, $pi);
		$c++;
		}
		#for nonPAR
		else{
		push(@nonPAR, $pi);
		$c++;	
		}
	}

	# Compute mean and median of observed values
	my $sum_PAR1 = 0;
	my $sum_PAR2 = 0;
	my $sum_XTR = 0;
	my $sum_nonPAR = 0;

	my $length_PAR1 = 0;
	my $length_PAR2 = 0;
	my $length_XTR = 0;
	my $length_nonPAR = 0;

	@PAR1 = sort(@PAR1);
	@PAR2 = sort(@PAR2);
	@XTR = sort(@XTR);
	@nonPAR = sort(@nonPAR);

	foreach my $PAR1 (@PAR1){
		if ($PAR1 !~ "NA"){
			$sum_PAR1 = $sum_PAR1 + $PAR1;
			$length_PAR1++;
		}
	}
	foreach my $PAR2 (@PAR2){
		if ($PAR2 !~ "NA"){
			$sum_PAR2 = $sum_PAR2 + $PAR2;
			$length_PAR2++;
		}
	}
	foreach my $XTR (@XTR){
		if ($XTR !~ "NA"){
			$sum_XTR = $sum_XTR + $XTR;
			$length_XTR++;
		}
	}
	foreach my $nonPAR (@nonPAR){
		if ($nonPAR !~ "NA"){
			$sum_nonPAR = $sum_nonPAR + $nonPAR;
			$length_nonPAR++;
		}
	}
	#compute the mean
	my $mean_PAR1 = $sum_PAR1/$length_PAR1;
	my $mean_PAR2;
	if ($length_PAR2 > 0){
		$mean_PAR2 = $sum_PAR2/$length_PAR2;
	}
	else{
		$mean_PAR2 = 1;	
		$mean_PAR2_NA_count++;
	}
	my $mean_XTR = $sum_XTR/$length_XTR;
	my $mean_nonPAR = $sum_nonPAR/$length_nonPAR;

	#push each replicate to the bootstrap array
	push(@b_PAR1, "$mean_PAR1");
	push(@b_XTR, "$mean_XTR");
	push(@b_PAR2, "$mean_PAR2");
	push(@b_nonPAR, "$mean_nonPAR");	
	
	@PAR1 = ();
	@PAR2 = ();
	@XTR = ();
	@nonPAR = ();

	$r++;
}

# Compute the empirical p-value
# my $sig_PAR1;
# my $sig_PAR2;
# my $sig_XTR;
# my $sig_nonPAR;
# 

# -------------------------------------------------
# # Compute empirical p, testing PAR1, PAR2, XTR > nonPAR
# -------------------------------------------------
 my $d = 0;

my $test_PAR1 = 0;
my $test_PAR2 = 0;
my $test_XTR = 0;

while ($d < $replicates){
	
	if ($b_nonPAR[$d]/$b_PAR1[$d] <= $mean_observed_nonPAR/$mean_observed_PAR1){
		$test_PAR1++;
	} 
	if ($b_nonPAR[$d]/$b_PAR2[$d] <= $mean_observed_nonPAR/$mean_observed_PAR2){
		$test_PAR2++;
	} 
	if ($b_nonPAR[$d]/$b_XTR[$d] <= $mean_observed_nonPAR/$mean_observed_XTR){
		$test_XTR++;
	} 
	$d++;
}

# while ($d < $replicates){
# 	
# 	if ($b_nonPAR[$d]-$b_PAR1[$d] <= $mean_observed_nonPAR-$mean_observed_PAR1){
# 		$test_PAR1++;
# 	} 
# 	if ($b_nonPAR[$d]-$b_PAR2[$d] <= $mean_observed_nonPAR-$mean_observed_PAR2){
# 		$test_PAR2++;
# 	} 
# 	if ($b_nonPAR[$d]-$b_XTR[$d] <= $mean_observed_nonPAR-$mean_observed_XTR){
# 		$test_XTR++;
# 	} 
# }


my $p_PAR1 = $test_PAR1/$replicates;
my $p_PAR2 = $test_PAR2/$replicates;
my $p_XTR = $test_XTR/$replicates;

print OUT "Region\tobserved\tp-value\n";
 
print OUT  "PAR1\t$mean_observed_PAR1\t$p_PAR1\n";
print OUT  "PAR2\t$mean_observed_PAR2\t$p_PAR2\n";
print OUT  "XTR\t$mean_observed_XTR\t$p_XTR\n";
print OUT  "nonPAR\t$mean_observed_nonPAR\tNA\n";

print "PAR2 = NA\t$mean_PAR2_NA_count\n";
# -------------------------------------------------
# # Compute the 95% CI
# -------------------------------------------------
# #sort arrays to find the top and bottom 2.5%
# @b_PAR1 = sort(@b_PAR1);
# @b_PAR2 = sort(@b_PAR2);
# @b_XTR = sort(@b_XTR);
# @b_nonPAR = sort(@b_nonPAR);		
# 
# # For the 95% CI, we want the top 97.5% and the bottom 2.5%.
# # If we just went from 1-1000 we would take 25 and 975, 
# # but since we start at 0, we will take 24 and 974
# 
# my $lower = $replicates*0.025;
# my $upper = $replicates*0.975;
# 
# my $lower_PAR1 = $b_PAR1[$lower];
# my $lower_PAR2 = $b_PAR2[$lower];
# my $lower_XTR = $b_XTR[$lower];
# my $lower_nonPAR = $b_nonPAR[$lower];	
# 
# my $upper_PAR1 = $b_PAR1[$upper];
# my $upper_PAR2 = $b_PAR2[$upper];
# my $upper_XTR = $b_XTR[$upper];
# my $upper_nonPAR = $b_nonPAR[$upper];	
# 
# print OUT "Region\tobserved\tlower\tupper\n";
# 
# print OUT  "PAR1\t$mean_observed_PAR1\t$lower_PAR1\t$upper_PAR1\n";
# print OUT  "PAR2\t$mean_observed_PAR2\t$lower_PAR2\t$upper_PAR2\n";
# print OUT  "XTR\t$mean_observed_XTR\t$lower_XTR\t$upper_XTR\n";
# print OUT  "nonPAR\t$mean_observed_nonPAR\t$lower_nonPAR\t$upper_nonPAR\n";
# -------------------------------------------------

close(OUT);

