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
my $output_file_All = "$output_directory"."split_filtered_pi_"."All26_amp.txt";

#open(OUT_Eur, ">$output_file_Eur");
#open(OUT_Afr, ">$output_file_Afr");
open(OUT_All, ">$output_file_All");

my (@info_All_amp1, $info_All_amp1, $major_All_amp1, $minor_All_amp1, $snps_All_amp1, $sampleSize_All_amp1);
my (@info_All_amp2, $info_All_amp2, $major_All_amp2, $minor_All_amp2, $snps_All_amp2, $sampleSize_All_amp2);
my (@info_All_amp3, $info_All_amp3, $major_All_amp3, $minor_All_amp3, $snps_All_amp3, $sampleSize_All_amp3);
my (@info_All_amp4, $info_All_amp4, $major_All_amp4, $minor_All_amp4, $snps_All_amp4, $sampleSize_All_amp4);
my (@info_All_amp5, $info_All_amp5, $major_All_amp5, $minor_All_amp5, $snps_All_amp5, $sampleSize_All_amp5);
my (@info_All_amp6, $info_All_amp6, $major_All_amp6, $minor_All_amp6, $snps_All_amp6, $sampleSize_All_amp6);
my (@info_All_amp7, $info_All_amp7, $major_All_amp7, $minor_All_amp7, $snps_All_amp7, $sampleSize_All_amp7);
my (@info_All_amp8, $info_All_amp8, $major_All_amp8, $minor_All_amp8, $snps_All_amp8, $sampleSize_All_amp8);
my (@info_All_amp9, $info_All_amp9, $major_All_amp9, $minor_All_amp9, $snps_All_amp9, $sampleSize_All_amp9);
my (@info_All_amp10, $info_All_amp10, $major_All_amp10, $minor_All_amp10, $snps_All_amp10, $sampleSize_All_amp10);
my (@info_All_amp11, $info_All_amp11, $major_All_amp11, $minor_All_amp11, $snps_All_amp11, $sampleSize_All_amp11);
my (@info_All_amp12, $info_All_amp12, $major_All_amp12, $minor_All_amp12, $snps_All_amp12, $sampleSize_All_amp12);

my $n_all = "52";

my $neutral_sites_All_amp1 = "1393914";
my $neutral_sites_All_amp2 = "1326161";
my $neutral_sites_All_amp3 = "1585285";
my $neutral_sites_All_amp4 = "1643020";
my $neutral_sites_All_amp5 = "1502106";
my $neutral_sites_All_amp6 = "1104729";
my $neutral_sites_All_amp7 = "1008946";
my $neutral_sites_All_amp8 = "888718";
my $neutral_sites_All_amp9 = "769330";
my $neutral_sites_All_amp10 = "481318";
my $neutral_sites_All_amp11 = "410304";
my $neutral_sites_All_amp12 = "145984";

my $pi_All_amp1 = 0;
my $part_All_amp1 = 0;
my $sum_All_amp1 = 0;

my $pi_All_amp2 = 0;
my $part_All_amp2 = 0;
my $sum_All_amp2 = 0;

my $pi_All_amp3 = 0;
my $part_All_amp3 = 0;
my $sum_All_amp3 = 0;

my $pi_All_amp4 = 0;
my $part_All_amp4 = 0;
my $sum_All_amp4 = 0;

my $pi_All_amp5 = 0;
my $part_All_amp5 = 0;
my $sum_All_amp5 = 0;

my $pi_All_amp6 = 0;
my $part_All_amp6 = 0;
my $sum_All_amp6 = 0;

my $pi_All_amp7 = 0;
my $part_All_amp7 = 0;
my $sum_All_amp7 = 0;

my $pi_All_amp8 = 0;
my $part_All_amp8 = 0;
my $sum_All_amp8 = 0;

my $pi_All_amp9 = 0;
my $part_All_amp9 = 0;
my $sum_All_amp9 = 0;

my $pi_All_amp10 = 0;
my $part_All_amp10 = 0;
my $sum_All_amp10 = 0;

my $pi_All_amp11 = 0;
my $part_All_amp11 = 0;
my $sum_All_amp11 = 0;

my $pi_All_amp12 = 0;
my $part_All_amp12 = 0;
my $sum_All_amp12 = 0;


my $input_file_All_amp1 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_amp1_p_sites.txt";
my $input_file_All_amp2 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_amp2_p_sites.txt";
my $input_file_All_amp3 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_amp3_p_sites.txt";
my $input_file_All_amp4 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_amp4_p_sites.txt";
my $input_file_All_amp5 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_amp5_p_sites.txt";
my $input_file_All_amp6 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_amp6_p_sites.txt";
my $input_file_All_amp7 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_amp7_p_sites.txt";
my $input_file_All_amp8 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_amp8_p_sites.txt";
my $input_file_All_amp9 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_amp9_p_sites.txt";
my $input_file_All_amp10 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_amp10_p_sites.txt";
my $input_file_All_amp11 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_amp11_p_sites.txt";
my $input_file_All_amp12 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_amp12_p_sites.txt";


open (CG_ALL_amp1, "<$input_file_All_amp1") or die "Cannot open All\n";
open (CG_ALL_amp2, "<$input_file_All_amp2") or die "Cannot open All\n";
open (CG_ALL_amp3, "<$input_file_All_amp3") or die "Cannot open All\n";
open (CG_ALL_amp4, "<$input_file_All_amp4") or die "Cannot open All\n";
open (CG_ALL_amp5, "<$input_file_All_amp5") or die "Cannot open All\n";
open (CG_ALL_amp6, "<$input_file_All_amp6") or die "Cannot open All\n";
open (CG_ALL_amp7, "<$input_file_All_amp7") or die "Cannot open All\n";
open (CG_ALL_amp8, "<$input_file_All_amp8") or die "Cannot open All\n";
open (CG_ALL_amp9, "<$input_file_All_amp9") or die "Cannot open All\n";
open (CG_ALL_amp10, "<$input_file_All_amp10") or die "Cannot open All\n";
open (CG_ALL_amp11, "<$input_file_All_amp11") or die "Cannot open All\n";
open (CG_ALL_amp12, "<$input_file_All_amp12") or die "Cannot open All\n";

while (my $cg_All_amp1 = <CG_ALL_amp1>){
		
	if ($cg_All_amp1 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_amp1);	#get rid of newline character
		@info_All_amp1 =  split( '\s' , $cg_All_amp1);
		
		$major_All_amp1 = 1 - $info_All_amp1[0];
		$minor_All_amp1 = $info_All_amp1[0];
		$snps_All_amp1 = $info_All_amp1[1];
		
		$part_All_amp1 = $major_All_amp1*$minor_All_amp1*$snps_All_amp1;
		
		$sum_All_amp1 = $sum_All_amp1 + $part_All_amp1;
	}
}
	
my $sampleSize_all = $n_all/($n_all -1);
$pi_All_amp1 = 2*($sum_All_amp1*$sampleSize_all)/($neutral_sites_All_amp1);
$pi_All_amp1 = sprintf("%.8f", $pi_All_amp1);		

print OUT_All "amp1\t$pi_All_amp1\n";
close(CG_ALL_amp1);




while (my $cg_All_amp2 = <CG_ALL_amp2>){
		
	if ($cg_All_amp2 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_amp2);	#get rid of newline character
		@info_All_amp2 =  split( '\s' , $cg_All_amp2);
		
		$major_All_amp2 = 1 - $info_All_amp2[0];
		$minor_All_amp2 = $info_All_amp2[0];
		$snps_All_amp2 = $info_All_amp2[1];
		
		$part_All_amp2 = $major_All_amp2*$minor_All_amp2*$snps_All_amp2;
		
		$sum_All_amp2 = $sum_All_amp2 + $part_All_amp2;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_amp2 = 2*($sum_All_amp2*$sampleSize_all)/($neutral_sites_All_amp2);
$pi_All_amp2 = sprintf("%.8f", $pi_All_amp2);		

print OUT_All "amp2\t$pi_All_amp2\n";
close(CG_ALL_amp2);




while (my $cg_All_amp3 = <CG_ALL_amp3>){
		
	if ($cg_All_amp3 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_amp3);	#get rid of newline character
		@info_All_amp3 =  split( '\s' , $cg_All_amp3);
		
		$major_All_amp3 = 1 - $info_All_amp3[0];
		$minor_All_amp3 = $info_All_amp3[0];
		$snps_All_amp3 = $info_All_amp3[1];
		
		$part_All_amp3 = $major_All_amp3*$minor_All_amp3*$snps_All_amp3;
		
		$sum_All_amp3 = $sum_All_amp3 + $part_All_amp3;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_amp3 = 2*($sum_All_amp3*$sampleSize_all)/($neutral_sites_All_amp3);
$pi_All_amp3 = sprintf("%.8f", $pi_All_amp3);		

print OUT_All "amp3\t$pi_All_amp3\n";
close(CG_ALL_amp3);




while (my $cg_All_amp4 = <CG_ALL_amp4>){
		
	if ($cg_All_amp4 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_amp4);	#get rid of newline character
		@info_All_amp4 =  split( '\s' , $cg_All_amp4);
		
		$major_All_amp4 = 1 - $info_All_amp4[0];
		$minor_All_amp4 = $info_All_amp4[0];
		$snps_All_amp4 = $info_All_amp4[1];
		
		$part_All_amp4 = $major_All_amp4*$minor_All_amp4*$snps_All_amp4;
		
		$sum_All_amp4 = $sum_All_amp4 + $part_All_amp4;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_amp4 = 2*($sum_All_amp4*$sampleSize_all)/($neutral_sites_All_amp4);
$pi_All_amp4 = sprintf("%.8f", $pi_All_amp4);		

print OUT_All "amp4\t$pi_All_amp4\n";
close(CG_ALL_amp4);




while (my $cg_All_amp5 = <CG_ALL_amp5>){
		
	if ($cg_All_amp5 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_amp5);	#get rid of newline character
		@info_All_amp5 =  split( '\s' , $cg_All_amp5);
		
		$major_All_amp5 = 1 - $info_All_amp5[0];
		$minor_All_amp5 = $info_All_amp5[0];
		$snps_All_amp5 = $info_All_amp5[1];
		
		$part_All_amp5 = $major_All_amp5*$minor_All_amp5*$snps_All_amp5;
		
		$sum_All_amp5 = $sum_All_amp5 + $part_All_amp5;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_amp5 = 2*($sum_All_amp5*$sampleSize_all)/($neutral_sites_All_amp5);
$pi_All_amp5 = sprintf("%.8f", $pi_All_amp5);		

print OUT_All "amp5\t$pi_All_amp5\n";
close(CG_ALL_amp5);




while (my $cg_All_amp6 = <CG_ALL_amp6>){
		
	if ($cg_All_amp6 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_amp6);	#get rid of newline character
		@info_All_amp6 =  split( '\s' , $cg_All_amp6);
		
		$major_All_amp6 = 1 - $info_All_amp6[0];
		$minor_All_amp6 = $info_All_amp6[0];
		$snps_All_amp6 = $info_All_amp6[1];
		
		$part_All_amp6 = $major_All_amp6*$minor_All_amp6*$snps_All_amp6;
		
		$sum_All_amp6 = $sum_All_amp6 + $part_All_amp6;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_amp6 = 2*($sum_All_amp6*$sampleSize_all)/($neutral_sites_All_amp6);
$pi_All_amp6 = sprintf("%.8f", $pi_All_amp6);		

print OUT_All "amp6\t$pi_All_amp6\n";
close(CG_ALL_amp6);




while (my $cg_All_amp7 = <CG_ALL_amp7>){
		
	if ($cg_All_amp7 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_amp7);	#get rid of newline character
		@info_All_amp7 =  split( '\s' , $cg_All_amp7);
		
		$major_All_amp7 = 1 - $info_All_amp7[0];
		$minor_All_amp7 = $info_All_amp7[0];
		$snps_All_amp7 = $info_All_amp7[1];
		
		$part_All_amp7 = $major_All_amp7*$minor_All_amp7*$snps_All_amp7;
		
		$sum_All_amp7 = $sum_All_amp7 + $part_All_amp7;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_amp7 = 2*($sum_All_amp7*$sampleSize_all)/($neutral_sites_All_amp7);
$pi_All_amp7 = sprintf("%.8f", $pi_All_amp7);		

print OUT_All "amp7\t$pi_All_amp7\n";
close(CG_ALL_amp7);




while (my $cg_All_amp8 = <CG_ALL_amp8>){
		
	if ($cg_All_amp8 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_amp8);	#get rid of newline character
		@info_All_amp8 =  split( '\s' , $cg_All_amp8);
		
		$major_All_amp8 = 1 - $info_All_amp8[0];
		$minor_All_amp8 = $info_All_amp8[0];
		$snps_All_amp8 = $info_All_amp8[1];
		
		$part_All_amp8 = $major_All_amp8*$minor_All_amp8*$snps_All_amp8;
		
		$sum_All_amp8 = $sum_All_amp8 + $part_All_amp8;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_amp8 = 2*($sum_All_amp8*$sampleSize_all)/($neutral_sites_All_amp8);
$pi_All_amp8 = sprintf("%.8f", $pi_All_amp8);		

print OUT_All "amp8\t$pi_All_amp8\n";
close(CG_ALL_amp8);




while (my $cg_All_amp9 = <CG_ALL_amp9>){
		
	if ($cg_All_amp9 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_amp9);	#get rid of newline character
		@info_All_amp9 =  split( '\s' , $cg_All_amp9);
		
		$major_All_amp9 = 1 - $info_All_amp9[0];
		$minor_All_amp9 = $info_All_amp9[0];
		$snps_All_amp9 = $info_All_amp9[1];
		
		$part_All_amp9 = $major_All_amp9*$minor_All_amp9*$snps_All_amp9;
		
		$sum_All_amp9 = $sum_All_amp9 + $part_All_amp9;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_amp9 = 2*($sum_All_amp9*$sampleSize_all)/($neutral_sites_All_amp9);
$pi_All_amp9 = sprintf("%.8f", $pi_All_amp9);		

print OUT_All "amp9\t$pi_All_amp9\n";
close(CG_ALL_amp9);




while (my $cg_All_amp10 = <CG_ALL_amp10>){
		
	if ($cg_All_amp10 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_amp10);	#get rid of newline character
		@info_All_amp10 =  split( '\s' , $cg_All_amp10);
		
		$major_All_amp10 = 1 - $info_All_amp10[0];
		$minor_All_amp10 = $info_All_amp10[0];
		$snps_All_amp10 = $info_All_amp10[1];
		
		$part_All_amp10 = $major_All_amp10*$minor_All_amp10*$snps_All_amp10;
		
		$sum_All_amp10 = $sum_All_amp10 + $part_All_amp10;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_amp10 = 2*($sum_All_amp10*$sampleSize_all)/($neutral_sites_All_amp10);
$pi_All_amp10 = sprintf("%.8f", $pi_All_amp10);		

print OUT_All "amp10\t$pi_All_amp10\n";
close(CG_ALL_amp10);




while (my $cg_All_amp11 = <CG_ALL_amp11>){
		
	if ($cg_All_amp11 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_amp11);	#get rid of newline character
		@info_All_amp11 =  split( '\s' , $cg_All_amp11);
		
		$major_All_amp11 = 1 - $info_All_amp11[0];
		$minor_All_amp11 = $info_All_amp11[0];
		$snps_All_amp11 = $info_All_amp11[1];
		
		$part_All_amp11 = $major_All_amp11*$minor_All_amp11*$snps_All_amp11;
		
		$sum_All_amp11 = $sum_All_amp11 + $part_All_amp11;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
$pi_All_amp11 = 2*($sum_All_amp11*$sampleSize_all)/($neutral_sites_All_amp11);
$pi_All_amp11 = sprintf("%.8f", $pi_All_amp11);		

print OUT_All "amp11\t$pi_All_amp11\n";
close(CG_ALL_amp11);




while (my $cg_All_amp12 = <CG_ALL_amp12>){
		
	if ($cg_All_amp12 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_amp12);	#get rid of newline character
		@info_All_amp12 =  split( '\s' , $cg_All_amp12);
		
		$major_All_amp12 = 1 - $info_All_amp12[0];
		$minor_All_amp12 = $info_All_amp12[0];
		$snps_All_amp12 = $info_All_amp12[1];
		
		$part_All_amp12 = $major_All_amp12*$minor_All_amp12*$snps_All_amp12;
		
		$sum_All_amp12 = $sum_All_amp12 + $part_All_amp12;
	}
}
$sampleSize_all = $n_all/($n_all -1);
$pi_All_amp12 = 2*($sum_All_amp12*$sampleSize_all)/($neutral_sites_All_amp12);
$pi_All_amp12 = sprintf("%.8f", $pi_All_amp12);		

print OUT_All "amp12\t$pi_All_amp12\n";
close(CG_ALL_amp12);
