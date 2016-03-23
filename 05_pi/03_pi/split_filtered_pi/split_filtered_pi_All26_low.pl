#! /usr/bin/perl -w
use strict;
use warnings;
use Term::ANSIColor;

#-------------------------------------------------------------------------------
# What: This program will compute pi from filtered CGS data
#-------------------------------------------------------------------------------

my $usage = "compute_pi_All26_females_0";

#------------------------------------------------

my $input_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/";
my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/03_pi/split_filtered_pi/";

my $population = "All26";
#my $population = "9Afr";
#my $population = "5Eur";

#_________RhemMac2

#my $output_file_Eur = "$output_directory"."pi_"."5Eur".".RheMac2.txt";
#my $output_file_Afr = "$output_directory"."pi_"."9Afr".".RheMac2.txt";
#my $output_file_All = "$output_directory"."pi_"."All26".".RheMac2.txt";

#_________panTro3

#my $output_file_Eur = "$output_directory"."pi_"."5Eur".".panTro3.txt";
#my $output_file_Afr = "$output_directory"."pi_"."9Afr".".panTro3.txt";
my $output_file_All = "$output_directory"."split_filtered_pi_"."All26_low.txt";

#open(OUT_Eur, ">$output_file_Eur");
#open(OUT_Afr, ">$output_file_Afr");
open(OUT_All, ">$output_file_All");

my (@info_All_low1, $info_All_low1, $major_All_low1, $minor_All_low1, $snps_All_low1, $sampleSize_All_low1);
my (@info_All_low2, $info_All_low2, $major_All_low2, $minor_All_low2, $snps_All_low2, $sampleSize_All_low2);
my (@info_All_low3, $info_All_low3, $major_All_low3, $minor_All_low3, $snps_All_low3, $sampleSize_All_low3);
my (@info_All_low4, $info_All_low4, $major_All_low4, $minor_All_low4, $snps_All_low4, $sampleSize_All_low4);
my (@info_All_low5, $info_All_low5, $major_All_low5, $minor_All_low5, $snps_All_low5, $sampleSize_All_low5);
my (@info_All_low6, $info_All_low6, $major_All_low6, $minor_All_low6, $snps_All_low6, $sampleSize_All_low6);
my (@info_All_low7, $info_All_low7, $major_All_low7, $minor_All_low7, $snps_All_low7, $sampleSize_All_low7);
my (@info_All_low8, $info_All_low8, $major_All_low8, $minor_All_low8, $snps_All_low8, $sampleSize_All_low8);

my $n_all = "52";

my $neutral_sites_All_low1 = "6506732";
my $neutral_sites_All_low2 = "4355368";
my $neutral_sites_All_low3 = "5418791";
my $neutral_sites_All_low4 = "26858814";
my $neutral_sites_All_low5 = "34591596";
my $neutral_sites_All_low6 = "21302212";
my $neutral_sites_All_low7 = "10824179";
my $neutral_sites_All_low8 = "3060465";

my $pi_All_low1 = 0;
my $part_All_low1 = 0;
my $sum_All_low1 = 0;

my $pi_All_low2 = 0;
my $part_All_low2 = 0;
my $sum_All_low2 = 0;

my $pi_All_low3 = 0;
my $part_All_low3 = 0;
my $sum_All_low3 = 0;

my $pi_All_low4 = 0;
my $part_All_low4 = 0;
my $sum_All_low4 = 0;

my $pi_All_low5 = 0;
my $part_All_low5 = 0;
my $sum_All_low5 = 0;

my $pi_All_low6 = 0;
my $part_All_low6 = 0;
my $sum_All_low6 = 0;

my $pi_All_low7 = 0;
my $part_All_low7 = 0;
my $sum_All_low7 = 0;

my $pi_All_low8 = 0;
my $part_All_low8 = 0;
my $sum_All_low8 = 0;


my $input_file_All_low1 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_low1_p_sites.txt";
my $input_file_All_low2 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_low2_p_sites.txt";
my $input_file_All_low3 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_low3_p_sites.txt";
my $input_file_All_low4 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_low4_p_sites.txt";
my $input_file_All_low5 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_low5_p_sites.txt";
my $input_file_All_low6 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_low6_p_sites.txt";
my $input_file_All_low7 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_low7_p_sites.txt";
my $input_file_All_low8 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_low8_p_sites.txt";

open (CG_ALL_low1, "<$input_file_All_low1") or die "Cannot open All\n";
open (CG_ALL_low2, "<$input_file_All_low2") or die "Cannot open All\n";
open (CG_ALL_low3, "<$input_file_All_low3") or die "Cannot open All\n";
open (CG_ALL_low4, "<$input_file_All_low4") or die "Cannot open All\n";
open (CG_ALL_low5, "<$input_file_All_low5") or die "Cannot open All\n";
open (CG_ALL_low6, "<$input_file_All_low6") or die "Cannot open All\n";
open (CG_ALL_low7, "<$input_file_All_low7") or die "Cannot open All\n";
open (CG_ALL_low8, "<$input_file_All_low8") or die "Cannot open All\n";

while (my $cg_All_low1 = <CG_ALL_low1>){
		
	if ($cg_All_low1 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_low1);	#get rid of newline character
		@info_All_low1 =  split( '\s' , $cg_All_low1);
		
		$major_All_low1 = 1 - $info_All_low1[0];
		$minor_All_low1 = $info_All_low1[0];
		$snps_All_low1 = $info_All_low1[1];
		
		$part_All_low1 = $major_All_low1*$minor_All_low1*$snps_All_low1;
		
		$sum_All_low1 = $sum_All_low1 + $part_All_low1;
	}
}
	
my $sampleSize_all = $n_all/($n_all -1);
$pi_All_low1 = 2*($sum_All_low1*$sampleSize_all)/($neutral_sites_All_low1);
$pi_All_low1 = sprintf("%.8f", $pi_All_low1);		

print OUT_All "low1\t$pi_All_low1\n";
close(CG_ALL_low1);




while (my $cg_All_low2 = <CG_ALL_low2>){
		
	if ($cg_All_low2 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_low2);	#get rid of newline character
		@info_All_low2 =  split( '\s' , $cg_All_low2);
		
		$major_All_low2 = 1 - $info_All_low2[0];
		$minor_All_low2 = $info_All_low2[0];
		$snps_All_low2 = $info_All_low2[1];
		
		$part_All_low2 = $major_All_low2*$minor_All_low2*$snps_All_low2;
		
		$sum_All_low2 = $sum_All_low2 + $part_All_low2;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_low2 = 2*($sum_All_low2*$sampleSize_all)/($neutral_sites_All_low2);
$pi_All_low2 = sprintf("%.8f", $pi_All_low2);		

print OUT_All "low2\t$pi_All_low2\n";
close(CG_ALL_low2);




while (my $cg_All_low3 = <CG_ALL_low3>){
		
	if ($cg_All_low3 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_low3);	#get rid of newline character
		@info_All_low3 =  split( '\s' , $cg_All_low3);
		
		$major_All_low3 = 1 - $info_All_low3[0];
		$minor_All_low3 = $info_All_low3[0];
		$snps_All_low3 = $info_All_low3[1];
		
		$part_All_low3 = $major_All_low3*$minor_All_low3*$snps_All_low3;
		
		$sum_All_low3 = $sum_All_low3 + $part_All_low3;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_low3 = 2*($sum_All_low3*$sampleSize_all)/($neutral_sites_All_low3);
$pi_All_low3 = sprintf("%.8f", $pi_All_low3);		

print OUT_All "low3\t$pi_All_low3\n";
close(CG_ALL_low3);




while (my $cg_All_low4 = <CG_ALL_low4>){
		
	if ($cg_All_low4 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_low4);	#get rid of newline character
		@info_All_low4 =  split( '\s' , $cg_All_low4);
		
		$major_All_low4 = 1 - $info_All_low4[0];
		$minor_All_low4 = $info_All_low4[0];
		$snps_All_low4 = $info_All_low4[1];
		
		$part_All_low4 = $major_All_low4*$minor_All_low4*$snps_All_low4;
		
		$sum_All_low4 = $sum_All_low4 + $part_All_low4;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_low4 = 2*($sum_All_low4*$sampleSize_all)/($neutral_sites_All_low4);
$pi_All_low4 = sprintf("%.8f", $pi_All_low4);		

print OUT_All "low4\t$pi_All_low4\n";
close(CG_ALL_low4);




while (my $cg_All_low5 = <CG_ALL_low5>){
		
	if ($cg_All_low5 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_low5);	#get rid of newline character
		@info_All_low5 =  split( '\s' , $cg_All_low5);
		
		$major_All_low5 = 1 - $info_All_low5[0];
		$minor_All_low5 = $info_All_low5[0];
		$snps_All_low5 = $info_All_low5[1];
		
		$part_All_low5 = $major_All_low5*$minor_All_low5*$snps_All_low5;
		
		$sum_All_low5 = $sum_All_low5 + $part_All_low5;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_low5 = 2*($sum_All_low5*$sampleSize_all)/($neutral_sites_All_low5);
$pi_All_low5 = sprintf("%.8f", $pi_All_low5);		

print OUT_All "low5\t$pi_All_low5\n";
close(CG_ALL_low5);




while (my $cg_All_low6 = <CG_ALL_low6>){
		
	if ($cg_All_low6 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_low6);	#get rid of newline character
		@info_All_low6 =  split( '\s' , $cg_All_low6);
		
		$major_All_low6 = 1 - $info_All_low6[0];
		$minor_All_low6 = $info_All_low6[0];
		$snps_All_low6 = $info_All_low6[1];
		
		$part_All_low6 = $major_All_low6*$minor_All_low6*$snps_All_low6;
		
		$sum_All_low6 = $sum_All_low6 + $part_All_low6;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_low6 = 2*($sum_All_low6*$sampleSize_all)/($neutral_sites_All_low6);
$pi_All_low6 = sprintf("%.8f", $pi_All_low6);		

print OUT_All "low6\t$pi_All_low6\n";
close(CG_ALL_low6);




while (my $cg_All_low7 = <CG_ALL_low7>){
		
	if ($cg_All_low7 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_low7);	#get rid of newline character
		@info_All_low7 =  split( '\s' , $cg_All_low7);
		
		$major_All_low7 = 1 - $info_All_low7[0];
		$minor_All_low7 = $info_All_low7[0];
		$snps_All_low7 = $info_All_low7[1];
		
		$part_All_low7 = $major_All_low7*$minor_All_low7*$snps_All_low7;
		
		$sum_All_low7 = $sum_All_low7 + $part_All_low7;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_low7 = 2*($sum_All_low7*$sampleSize_all)/($neutral_sites_All_low7);
$pi_All_low7 = sprintf("%.8f", $pi_All_low7);		

print OUT_All "low7\t$pi_All_low7\n";
close(CG_ALL_low7);




while (my $cg_All_low8 = <CG_ALL_low8>){
		
	if ($cg_All_low8 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_low8);	#get rid of newline character
		@info_All_low8 =  split( '\s' , $cg_All_low8);
		
		$major_All_low8 = 1 - $info_All_low8[0];
		$minor_All_low8 = $info_All_low8[0];
		$snps_All_low8 = $info_All_low8[1];
		
		$part_All_low8 = $major_All_low8*$minor_All_low8*$snps_All_low8;
		
		$sum_All_low8 = $sum_All_low8 + $part_All_low8;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_low8 = 2*($sum_All_low8*$sampleSize_all)/($neutral_sites_All_low8);
$pi_All_low8 = sprintf("%.8f", $pi_All_low8);		

print OUT_All "low8\t$pi_All_low8\n";
close(CG_ALL_low8);