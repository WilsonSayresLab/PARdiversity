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
my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/04_normalized_pi/normalized_split_filtered_pi/";

my $population = "All26";
#my $population = "9Afr";
#my $population = "5Eur";

#_________RhemMac3

#my $output_file_Eur = "$output_directory"."pi_"."5Eur".".RheMac3.txt";
#my $output_file_Afr = "$output_directory"."pi_"."9Afr".".RheMac3.txt";
#my $output_file_All = "$output_directory"."pi_"."All26".".RheMac3.txt";

#_________panTro4

#my $output_file_Eur = "$output_directory"."pi_"."5Eur".".panTro4.txt";
#my $output_file_Afr = "$output_directory"."pi_"."9Afr".".panTro4.txt";
#my $output_file_All = "$output_directory"."pi_"."All26".".panTro4.txt";

#_________canFam3

#my $output_file_Eur = "$output_directory"."pi_"."5Eur".".canFam3.txt";
#my $output_file_Afr = "$output_directory"."pi_"."9Afr".".canFam3.txt";
#my $output_file_All = "$output_directory"."pi_"."All26".".canFam3.txt";

#_________mm10

#my $output_file_Eur = "$output_directory"."pi_"."5Eur".".mm10.txt";
#my $output_file_Afr = "$output_directory"."pi_"."9Afr".".mm10.txt";
my $output_file_All = "$output_directory"."pi_"."All26".".mm10.txt";

#open(OUT_Eur, ">$output_file_Eur");
#open(OUT_Afr, ">$output_file_Afr");
open(OUT_All, ">$output_file_All");

#my (@info_All_PAR1, $info_All_PAR1, $major_All_PAR1, $minor_All_PAR1, $snps_All_PAR1, $sampleSize_All_PAR1);
#my (@info_Afr_PAR1, $info_Afr_PAR1, $major_Afr_PAR1, $minor_Afr_PAR1, $snps_Afr_PAR1, $sampleSize_Afr_PAR1);
#my (@info_Eur_PAR1, $info_Eur_PAR1, $major_Eur_PAR1, $minor_Eur_PAR1, $snps_Eur_PAR1, $sampleSize_Eur_PAR1);

my (@info_All_PAR2, $info_All_PAR2, $major_All_PAR2, $minor_All_PAR2, $snps_All_PAR2, $sampleSize_All_PAR2);
#my (@info_Afr_PAR2, $info_Afr_PAR2, $major_Afr_PAR2, $minor_Afr_PAR2, $snps_Afr_PAR2, $sampleSize_Afr_PAR2);
#my (@info_Eur_PAR2, $info_Eur_PAR2, $major_Eur_PAR2, $minor_Eur_PAR2, $snps_Eur_PAR2, $sampleSize_Eur_PAR2);

my (@info_All_nonPAR, $info_All_nonPAR, $major_All_nonPAR, $minor_All_nonPAR, $snps_All_nonPAR, $sampleSize_All_nonPAR);
#my (@info_Afr_nonPAR, $info_Afr_nonPAR, $major_Afr_nonPAR, $minor_Afr_nonPAR, $snps_Afr_nonPAR, $sampleSize_Afr_nonPAR);
#my (@info_Eur_nonPAR, $info_Eur_nonPAR, $major_Eur_nonPAR, $minor_Eur_nonPAR, $snps_Eur_nonPAR, $sampleSize_Eur_nonPAR);

my (@info_All_XTR, $info_All_XTR, $major_All_XTR, $minor_All_XTR, $snps_All_XTR, $sampleSize_All_XTR);
#my (@info_Afr_XTR, $info_Afr_XTR, $major_Afr_XTR, $minor_Afr_XTR, $snps_Afr_XTR, $sampleSize_Afr_XTR);
#my (@info_Eur_XTR, $info_Eur_XTR, $major_Eur_XTR, $minor_Eur_XTR, $snps_Eur_XTR, $sampleSize_Eur_XTR);

my $n_eur = "10"; my $n_afr = "18"; my $n_all = "52";

#my $neutral_sites_Eur_PAR1 = "736601";		#The neutral_sites come from the filtered_called_sites_by_region programs
#my $neutral_sites_Eur_PAR2 = "87281";
#my $neutral_sites_Eur_nonPAR = "56091253";
#my $neutral_sites_Eur_XTR = "1489092";

#my $neutral_sites_Afr_PAR1 = "714528";
#my $neutral_sites_Afr_PAR2 = "83511";
#my $neutral_sites_Afr_nonPAR = "55422895";
#my $neutral_sites_Afr_XTR = "1461040";

#my $neutral_sites_All_PAR1 = "679353";
my $neutral_sites_All_PAR2 = "26629";
my $neutral_sites_All_nonPAR = "32083140";
my $neutral_sites_All_XTR = "1383357";

#my $p_panTro4_PAR1 = "0.0226430335853"; 	#These values come from the filtered_subs_rates_region galaxy files
#my $p_panTro4_PAR2 = "0.00872039501213";
#my $p_panTro4_nonPAR = "0.00981373935421"; 
#my $p_panTro4_XTR = "0.010937034795"; 
	
#my $p_RheMac3_PAR1 = "0.0998920097252"; 
#my $p_RheMac3_PAR2 = "0.0409671459555";
#my $p_RheMac3_nonPAR = "0.0497016040247"; 
#my $p_RheMac3_XTR = "0.0569532570137"; 

#my $p_canFam3_PAR1 = "0.337717062562"; 
#my $p_canFam3_PAR2 = "0.218771125281";
#my $p_canFam3_nonPAR = "0.234423255096"; 
#my $p_canFam3_XTR = "0.245717483972"; 

#my $p_mm10_PAR1 = "NA"; 
my $p_mm10_PAR2 = "0.257609175121";
my $p_mm10_nonPAR = "0.305070143163"; 
my $p_mm10_XTR = "0.336725419817"; 

#my $pi_Eur_PAR1 = 0;
#my $part_Eur_PAR1 = 0;
#my $sum_Eur_PAR1 = 0;

#my $pi_Eur_PAR2 = 0;
#my $part_Eur_PAR2 = 0;
#my $sum_Eur_PAR2 = 0;

#my $pi_Eur_nonPAR = 0;
#my $part_Eur_nonPAR = 0;
#my $sum_Eur_nonPAR = 0;

#my $pi_Eur_XTR = 0;
#my $part_Eur_XTR = 0;
#my $sum_Eur_XTR = 0;
	
#my $pi_Afr_PAR1 = 0;
#my $part_Afr_PAR1 = 0;
#my $sum_Afr_PAR1 = 0;

#my $pi_Afr_PAR2 = 0;
#my $part_Afr_PAR2 = 0;
#my $sum_Afr_PAR2 = 0;

#my $pi_Afr_nonPAR = 0;
#my $part_Afr_nonPAR = 0;
#my $sum_Afr_nonPAR = 0;

#my $pi_Afr_XTR = 0;
#my $part_Afr_XTR = 0;
#my $sum_Afr_XTR = 0;

#my $pi_All_PAR1 = 0;
#my $part_All_PAR1 = 0;
#my $sum_All_PAR1 = 0;

my $pi_All_PAR2 = 0;
my $part_All_PAR2 = 0;
my $sum_All_PAR2 = 0;

my $pi_All_nonPAR = 0;
my $part_All_nonPAR = 0;
my $sum_All_nonPAR = 0;

my $pi_All_XTR = 0;
my $part_All_XTR = 0;
my $sum_All_XTR = 0;

#my $input_file_Eur_PAR1 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."5Eur_PAR1_p_sites.txt";
#my $input_file_Eur_PAR2 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."5Eur_PAR2_p_sites.txt";
#my $input_file_Eur_nonPAR = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."5Eur_nonPAR_p_sites.txt";
#my $input_file_Eur_XTR = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."5Eur_XTR_p_sites.txt";

#my $input_file_Afr_PAR1 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."9Afr_PAR1_p_sites.txt";
#my $input_file_Afr_PAR2 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."9Afr_PAR2_p_sites.txt";
#my $input_file_Afr_nonPAR = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."9Afr_nonPAR_p_sites.txt";
#my $input_file_Afr_XTR = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."9Afr_XTR_p_sites.txt";

#my $input_file_All_PAR1 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_PAR1_p_sites.txt";
my $input_file_All_PAR2 = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_PAR2_p_sites.txt";
my $input_file_All_nonPAR = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_nonPAR_p_sites.txt";
my $input_file_All_XTR = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/"."All26_XTR_p_sites.txt";

#open (CG_EUR_PAR1, "<$input_file_Eur_PAR1") or die "Cannot open 1E\n";
#open (CG_EUR_PAR2, "<$input_file_Eur_PAR2") or die "Cannot open 2E\n";
#open (CG_EUR_nonPAR, "<$input_file_Eur_nonPAR") or die "Cannot open 3E\n";
#open (CG_EUR_XTR, "<$input_file_Eur_XTR") or die "Cannot open 1Eu\n";

#open (CG_AFR_PAR1, "<$input_file_Afr_PAR1") or die "Cannot open 1Af\n";
#open (CG_AFR_PAR2, "<$input_file_Afr_PAR2") or die "Cannot open 2Af\n";
#open (CG_AFR_nonPAR, "<$input_file_Afr_nonPAR") or die "Cannot open 3Af\n";
#open (CG_AFR_XTR, "<$input_file_Afr_XTR") or die "Cannot open 1Af\n";

#open (CG_ALL_PAR1, "<$input_file_All_PAR1") or die "Cannot open All\n";
open (CG_ALL_PAR2, "<$input_file_All_PAR2") or die "Cannot open All\n";
open (CG_ALL_nonPAR,  "<$input_file_All_nonPAR") or die "Cannot open All\n";
open (CG_ALL_XTR, "<$input_file_All_XTR") or die "Cannot open All\n";

# while (my $cg_All_PAR1 = <CG_ALL_PAR1>){
# 		
# 	if ($cg_All_PAR1 =~ /sites/){
# 		next;
# 	}
# 	else{
# 		chomp($cg_All_PAR1);	#get rid of newline character
# 		@info_All_PAR1 =  split( '\s' , $cg_All_PAR1);
# 		
# 		$major_All_PAR1 = 1 - $info_All_PAR1[0];
# 		$minor_All_PAR1 = $info_All_PAR1[0];
# 		$snps_All_PAR1 = $info_All_PAR1[1];
# 		
# 		$part_All_PAR1 = $major_All_PAR1*$minor_All_PAR1*$snps_All_PAR1;
# 		
# 		$sum_All_PAR1 = $sum_All_PAR1 + $part_All_PAR1;
# 	}
# }
# 	
# my $sampleSize_all = $n_all/($n_all -1);
# #$pi_All_PAR1 = 2*($sum_All_PAR1*$sampleSize_all)/($neutral_sites_All_PAR1 * $p_panTro4_PAR1);
# #$pi_All_PAR1 = 2*($sum_All_PAR1*$sampleSize_all)/($neutral_sites_All_PAR1 * $p_RheMac3_PAR1);
# #$pi_All_PAR1 = 2*($sum_All_PAR1*$sampleSize_all)/($neutral_sites_All_PAR1 * $p_canFam3_PAR1);
# $pi_All_PAR1 = 2*($sum_All_PAR1*$sampleSize_all)/($neutral_sites_All_PAR1 * $p_mm10_PAR1);
# $pi_All_PAR1 = sprintf("%.8f", $pi_All_PAR1);		
# 
# print OUT_All "PAR1\t$pi_All_PAR1\n";
# close(CG_ALL_PAR1);




while (my $cg_All_PAR2 = <CG_ALL_PAR2>){
		
	if ($cg_All_PAR2 =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_PAR2);	#get rid of newline character
		@info_All_PAR2 =  split( '\s' , $cg_All_PAR2);
		
		$major_All_PAR2 = 1 - $info_All_PAR2[0];
		$minor_All_PAR2 = $info_All_PAR2[0];
		$snps_All_PAR2 = $info_All_PAR2[1];
		
		$part_All_PAR2 = $major_All_PAR2*$minor_All_PAR2*$snps_All_PAR2;
		
		$sum_All_PAR2 = $sum_All_PAR2 + $part_All_PAR2;
	}
}
	
my $sampleSize_all = $n_all/($n_all -1);
#$pi_All_PAR2 = 2*($sum_All_PAR2*$sampleSize_all)/($neutral_sites_All_PAR2 * $p_panTro4_PAR2);
#$pi_All_PAR2 = 2*($sum_All_PAR2*$sampleSize_all)/($neutral_sites_All_PAR2 * $p_RheMac3_PAR2);
#$pi_All_PAR2 = 2*($sum_All_PAR2*$sampleSize_all)/($neutral_sites_All_PAR2 * $p_canFam3_PAR2);
$pi_All_PAR2 = 2*($sum_All_PAR2*$sampleSize_all)/($neutral_sites_All_PAR2 * $p_mm10_PAR2);
$pi_All_PAR2 = sprintf("%.8f", $pi_All_PAR2);		

print OUT_All "PAR2\t$pi_All_PAR2\n";
close(CG_ALL_PAR2);



while (my $cg_All_nonPAR = <CG_ALL_nonPAR>){
		
	if ($cg_All_nonPAR =~ /sites/){
		next;
	}
	else{
		chomp($cg_All_nonPAR);	#get rid of newline character
		@info_All_nonPAR =  split( '\s' , $cg_All_nonPAR);
		
		$major_All_nonPAR = 1 - $info_All_nonPAR[0];
		$minor_All_nonPAR = $info_All_nonPAR[0];
		$snps_All_nonPAR = $info_All_nonPAR[1];
		
		$part_All_nonPAR = $major_All_nonPAR*$minor_All_nonPAR*$snps_All_nonPAR;
		
		$sum_All_nonPAR = $sum_All_nonPAR + $part_All_nonPAR;
	}
}
	
$sampleSize_all = $n_all/($n_all -1);
#$pi_All_nonPAR = 2*($sum_All_nonPAR*$sampleSize_all)/($neutral_sites_All_nonPAR * $p_panTro4_nonPAR);
#$pi_All_nonPAR = 2*($sum_All_nonPAR*$sampleSize_all)/($neutral_sites_All_nonPAR * $p_RheMac3_nonPAR);
#$pi_All_nonPAR = 2*($sum_All_nonPAR*$sampleSize_all)/($neutral_sites_All_nonPAR * $p_canFam3_nonPAR);
$pi_All_nonPAR = 2*($sum_All_nonPAR*$sampleSize_all)/($neutral_sites_All_nonPAR * $p_mm10_nonPAR);
$pi_All_nonPAR = sprintf("%.8f", $pi_All_nonPAR);		

print OUT_All "nonPAR\t$pi_All_nonPAR\n";
close(CG_ALL_nonPAR);




while (my $cg_All_XTR = <CG_ALL_XTR>){
		
	if ($cg_All_XTR =~ /sites/){ 
		next;
	}
	else{
		chomp($cg_All_XTR);	
		@info_All_XTR =  split( '\s' , $cg_All_XTR); 
		
		$major_All_XTR = 1 - $info_All_XTR[0];
		$minor_All_XTR = $info_All_XTR[0];
		$snps_All_XTR = $info_All_XTR[1];
		
		$part_All_XTR = $major_All_XTR*$minor_All_XTR*$snps_All_XTR;
		
		$sum_All_XTR = $sum_All_XTR + $part_All_XTR;
	}
}
	
$sampleSize_all = $n_all/($n_all -1); 
#$pi_All_XTR = 2*($sum_All_XTR*$sampleSize_all)/($neutral_sites_All_XTR * $p_panTro4_XTR);  
#$pi_All_XTR = 2*($sum_All_XTR*$sampleSize_all)/($neutral_sites_All_XTR * $p_RheMac3_XTR);
#$pi_All_XTR = 2*($sum_All_XTR*$sampleSize_all)/($neutral_sites_All_XTR * $p_canFam3_XTR); 
$pi_All_XTR = 2*($sum_All_XTR*$sampleSize_all)/($neutral_sites_All_XTR * $p_mm10_XTR);  
$pi_All_XTR = sprintf("%.8f", $pi_All_XTR);		

print OUT_All "XTR\t$pi_All_XTR\n"; 
close(CG_ALL_XTR);

#--------------------------------------------------------------
#--------------------------------------------------------------

#while (my $cg_Afr_PAR1 = <CG_AFR_PAR1>){
#		
#	if ($cg_Afr_PAR1 =~ /sites/){
#		next;
#	}
#	else{
#		chomp($cg_Afr_PAR1);	#get rid of newline character
#		@info_Afr_PAR1 =  split( '\s' , $cg_Afr_PAR1);
#		
#		$major_Afr_PAR1 = 1 - $info_Afr_PAR1[0];
#		$minor_Afr_PAR1 = $info_Afr_PAR1[0];
#		$snps_Afr_PAR1 = $info_Afr_PAR1[1];
#		
#		$part_Afr_PAR1 = $major_Afr_PAR1*$minor_Afr_PAR1*$snps_Afr_PAR1;
#		
#		$sum_Afr_PAR1 = $sum_Afr_PAR1 + $part_Afr_PAR1;
#	}
#}
#	
#my $sampleSize_afr = $n_afr/($n_afr -1);
#$pi_Afr_PAR1 = 2*($sum_Afr_PAR1*$sampleSize_afr)/($neutral_sites_Afr_PAR1 * $p_panTro4_PAR1);
#$pi_Afr_PAR1 = 2*($sum_Afr_PAR1*$sampleSize_afr)/($neutral_sites_Afr_PAR1 * $p_RheMac3_PAR1);
#$pi_Afr_PAR1 = sprintf("%.8f", $pi_Afr_PAR1);		
#
#print "$pi_Afr_PAR1";
#
#print OUT_Afr "PAR1\t$pi_Afr_PAR2\n";
#close(CG_AFR_PAR1);




#while (my $cg_Afr_PAR2 = <CG_AFR_PAR2>){
#		
#	if ($cg_Afr_PAR2 =~ /sites/){
#		next;
#	}
#	else{
#		chomp($cg_Afr_PAR2);	#get rid of newline character
#		@info_Afr_PAR2 =  split( '\s' , $cg_Afr_PAR2);
#		
#		$major_Afr_PAR2 = 1 - $info_Afr_PAR2[0];
#		$minor_Afr_PAR2 = $info_Afr_PAR2[0];
#		$snps_Afr_PAR2 = $info_Afr_PAR2[1];
#		
#		$part_Afr_PAR2 = $major_Afr_PAR2*$minor_Afr_PAR2*$snps_Afr_PAR2;
#		
#		$sum_Afr_PAR2 = $sum_Afr_PAR2 + $part_Afr_PAR2;
#	}
#}
#	
#$sampleSize_afr = $n_afr/($n_afr -1);
#$pi_Afr_PAR2 = 2*($sum_Afr_PAR2*$sampleSize_afr)/($neutral_sites_Afr_PAR2 * $p_panTro4_PAR2);
#$pi_Afr_PAR2 = 2*($sum_Afr_PAR2*$sampleSize_afr)/($neutral_sites_Afr_PAR2 * $p_RheMac3_PAR2);
#$pi_Afr_PAR2 = sprintf("%.8f", $pi_Afr_PAR2);		
#
#print OUT_Afr "PAR2\t$pi_Afr_PAR2\n";
#close(CG_AFR_PAR2);




#while (my $cg_Afr_nonPAR = <CG_AFR_nonPAR>){
#		
#	if ($cg_Afr_nonPAR =~ /sites/){
#		next;
#	}
#	else{
#		chomp($cg_Afr_nonPAR);	#get rid of newline character
#		@info_Afr_nonPAR =  split( '\s' , $cg_Afr_nonPAR);
#		
#		$major_Afr_nonPAR = 1 - $info_Afr_nonPAR[0];
#		$minor_Afr_nonPAR = $info_Afr_nonPAR[0];
#		$snps_Afr_nonPAR = $info_Afr_nonPAR[1];
#		
#		$part_Afr_nonPAR = $major_Afr_nonPAR*$minor_Afr_nonPAR*$snps_Afr_nonPAR;
#		
#		$sum_Afr_nonPAR = $sum_Afr_nonPAR + $part_Afr_nonPAR;
#	}
#}
#	
#$sampleSize_afr = $n_afr/($n_afr -1);
#$pi_Afr_nonPAR = 2*($sum_Afr_nonPAR*$sampleSize_afr)/($neutral_sites_Afr_nonPAR * $p_panTro4_nonPAR);
#$pi_Afr_nonPAR = 2*($sum_Afr_nonPAR*$sampleSize_afr)/($neutral_sites_Afr_nonPAR * $p_RheMac3_nonPAR);
#$pi_Afr_nonPAR = sprintf("%.8f", $pi_Afr_nonPAR);		
#
#print OUT_Afr "nonPAR\t$pi_Afr_nonPAR\n";
#close(CG_AFR_nonPAR);




#while (my $cg_Afr_XTR = <CG_AFR_XTR>){
#		
#	if ($cg_Afr_XTR =~ /sites/){ 
#		next;
#	}
#	else{
#		chomp($cg_Afr_XTR);	
#		@info =  split( '\s' , $cg_Afr_XTR); 
#		
#		$major_Afr_XTR = 1 - $info_Afr_XTR[0];
#		$minor_Afr_XTR = $info_Afr_XTR[0];
#		$snps_Afr_XTR = $info_Afr_XTR[1];
#		
#		$part_Afr_XTR = $major_Afr_XTR*$minor_Afr_XTR*$snps_Afr_XTR;
#		
#		$sum_Afr_XTR = $sum_Afr_XTR + $part_Afr_XTR;
#	}
#}
#	
#$sampleSize_afr = $n_afr/($n_afr -1); 
#$pi_Afr_XTR = 2*($sum_Afr_XTR*$sampleSize_afr)/($neutral_sites_Afr_XTR * $p_panTro4_XTR); 
#$pi_Afr_XTR = 2*($sum_Afr_XTR*$sampleSize_afr)/($neutral_sites_Afr_XTR * $p_RheMac3_XTR);  
#$pi_Afr_XTR = sprintf("%.8f", $pi_Afr_XTR);		
#
#print OUT_Afr "$XTR\t$pi_Afr_XTR\n"; 
#close(CG_AFR_XTR);

#--------------------------------------------------------------
#--------------------------------------------------------------

#while (my $cg_Eur_PAR1 = <CG_EUR_PAR1>){
#		
#	if ($cg_Eur_PAR1 =~ /sites/){
#		next;
#	}
#	else{
#		chomp($cg_Eur_PAR1);	#get rid of newline character
#		@info_Eur_PAR1 =  split( '\s' , $cg_Eur_PAR1);
#		
#		$major_Eur_PAR1 = 1 - $info_Eur_PAR1[0];
#		$minor_Eur_PAR1 = $info_Eur_PAR1[0];
#		$snps_Eur_PAR1 = $info_Eur_PAR1[1];
#		
#		$part_Eur_PAR1 = $major_Eur_PAR1*$minor_Eur_PAR1*$snps_Eur_PAR1;
#		
#		$sum_Eur_PAR1 = $sum_Eur_PAR1 + $part_Eur_PAR1;
#	}
#}
#	
#my $sampleSize_eur = $n_eur/($n_eur -1);
#$pi_Eur_PAR1 = 2*($sum_Eur_PAR1*$sampleSize_eur)/($neutral_sites_Eur_PAR1 * $p_panTro4_PAR1);
#$pi_Eur_PAR1 = 2*($sum_Eur_PAR1*$sampleSize_eur)/($neutral_sites_Eur_PAR1 * $p_RheMac3_PAR1);
#$pi_Eur_PAR1 = sprintf("%.8f", $pi_Eur_PAR1);		
#
#print OUT_Eur "PAR1\t$pi_Eur_PAR1\n";
#close(CG_EUR_PAR1);




#while (my $cg_Eur_PAR2 = <CG_EUR_PAR2>){
#		
#	if ($cg_Eur_PAR2 =~ /sites/){
#		next;
#	}
#	else{
#		chomp($cg_Eur_PAR2);	#get rid of newline character
#		@info_Eur_PAR2 =  split( '\s' , $cg_Eur_PAR2);
#		
#		$major_Eur_PAR2 = 1 - $info_Eur_PAR2[0];
#		$minor_Eur_PAR2 = $info_Eur_PAR2[0];
#		$snps_Eur_PAR2 = $info_Eur_PAR2[1];
#		
#		$part_Eur_PAR2 = $major_Eur_PAR2*$minor_Eur_PAR2*$snps_Eur_PAR2;
#		
#		$sum_Eur_PAR2 = $sum_Eur_PAR2 + $part_Eur_PAR2;
#	}
#}
#	
#$sampleSize_eur = $n_eur/($n_eur -1);
#$pi_Eur_PAR2 = 2*($sum_Eur_PAR2*$sampleSize_eur)/($neutral_sites_Eur_PAR2 * $p_panTro4_PAR2);
#$pi_Eur_PAR2 = 2*($sum_Eur_PAR2*$sampleSize_eur)/($neutral_sites_Eur_PAR2 * $p_RheMac3_PAR2);
#$pi_Eur_PAR2 = sprintf("%.8f", $pi_Eur_PAR2);		
#
#print OUT_Eur "PAR2\t$pi_Eur_PAR2\n";
#close(CG_EUR_PAR2);




#while (my $cg_Eur_nonPAR = <CG_EUR_nonPAR>){
#		
#	if ($cg_Eur_nonPAR =~ /sites/){
#		next;
#	}
#	else{
#		chomp($cg_Eur_nonPAR);	#get rid of newline character
#		@info_Eur_nonPAR =  split( '\s' , $cg_Eur_nonPAR);
#		
#		$major_Eur_nonPAR = 1 - $info_Eur_nonPAR[0];
#		$minor_Eur_nonPAR = $info_Eur_nonPAR[0];
#		$snps_Eur_nonPAR = $info_Eur_nonPAR[1];
#		
#		$part_Eur_nonPAR = $major_Eur_nonPAR*$minor_Eur_nonPAR*$snps_Eur_nonPAR;
#		
#		$sum_Eur_nonPAR = $sum_Eur_nonPAR + $part_Eur_nonPAR;
#	}
#}
#	
#$sampleSize_eur = $n_eur/($n_eur -1);
#$pi_Eur_nonPAR = 2*($sum_Eur_nonPAR*$sampleSize_eur)/($neutral_sites_Eur_nonPAR * $p_panTro4_nonPAR);
#$pi_Eur_nonPAR = 2*($sum_Eur_nonPAR*$sampleSize_eur)/($neutral_sites_Eur_nonPAR * $p_RheMac3_nonPAR);
#$pi_Eur_nonPAR = sprintf("%.8f", $pi_Eur_nonPAR);		
#
#print OUT_Eur "nonPAR\t$pi_Eur_nonPAR\n";
#close(CG_EUR_nonPAR);




#while (my $cg_EUR_XTR = <CG_EUR_XTR>){
#		
#	if ($cg_EUR_XTR =~ /sites/){ 
#		next;
#	}
#	else{
#		chomp($cg_EUR_XTR);	
#		@info =  split( '\s' , $cg_EUR_XTR); 
#		
#		$major_Eur_XTR = 1 - $info_Eur_XTR[0];
#		$minor_Eur_XTR = $info_Eur_XTR[0];
#		$snps_Eur_XTR = $info_Eur_XTR[1];
#		
#		$part_Eur_XTR = $major_Eur_XTR*$minor_Eur_XTR*$snps_Eur_XTR;
#		
#		$sum_Eur_XTR = $sum_Eur_XTR + $part_Eur_XTR;
#	}
#}
#	
#$sampleSize_eur = $n_eur/($n_eur -1); 
#$pi_Eur_XTR = 2*($sum_Eur_XTR*$sampleSize_eur)/($neutral_sites_Eur_XTR * $p_panTro4_XTR);  
#$pi_Eur_XTR = 2*($sum_Eur_XTR*$sampleSize_eur)/($neutral_sites_Eur_XTR * $p_RheMac3_XTR);
#$pi_Eur_XTR = sprintf("%.8f", $pi_Eur_XTR);		
#
#print OUT_Eur "$XTR\t$pi_Eur_XTR\n"; 
#close (CG_Eur_XTR);
