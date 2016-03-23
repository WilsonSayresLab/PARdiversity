#! /usr/bin/perl -w
use strict;
use warnings;
use Term::ANSIColor;

#-------------------------------------------------------------------------------
# What: This program will compute the minor allele frequency from filtered CGS data in the PAR1 PAR2 and non PAR sequences
#		
#-------------------------------------------------------------------------------

my $usage = "filtered_split_make_freq_tables_All26_amp9.pl";

#-------------------------------------------------------------------------------

my (@info, $info, $position);
my ($pop_1, $pop_2, $pop_3, $pop_4, $pop_5, $pop_6, $pop_7, $pop_8);
my ($pop_9, $pop_10, $pop_11, $pop_12, $pop_13, $pop_14, $pop_15, $pop_16);
my ($pop_17, $pop_18, $pop_19, $pop_20, $pop_21, $pop_22, $pop_23, $pop_24);
my ($pop_25, $pop_26, $pop_27, $pop_28, $pop_29, $pop_30, $pop_31, $pop_32);
my ($pop_33, $pop_34, $pop_35, $pop_36, $pop_37, $pop_38, $pop_39, $pop_40);
my ($pop_41, $pop_42, $pop_43, $pop_44, $pop_45, $pop_46, $pop_47, $pop_48);
my ($pop_49, $pop_50, $pop_51, $pop_52);

$pop_1 = 0; $pop_2 = 0; $pop_3 = 0; $pop_4 = 0; $pop_5 = 0; $pop_6 = 0; $pop_7 = 0; $pop_8 = 0;
$pop_9 = 0; $pop_10 = 0; $pop_11 = 0; $pop_12 = 0; $pop_13 = 0; $pop_14 = 0; $pop_15 = 0; $pop_16 = 0;
$pop_17 = 0; $pop_18 = 0; $pop_19 = 0; $pop_20 = 0; $pop_21 = 0; $pop_22 = 0; $pop_23 = 0; $pop_24 = 0;
$pop_25 = 0; $pop_26 = 0; $pop_27 = 0; $pop_28 = 0; $pop_29 = 0; $pop_30 = 0; $pop_31 = 0; $pop_32 = 0;
$pop_33 = 0; $pop_34 = 0; $pop_35 = 0; $pop_36 = 0; $pop_37 = 0; $pop_38 = 0; $pop_39 = 0; $pop_40 = 0;
$pop_41 = 0; $pop_42 = 0; $pop_43 = 0; $pop_44 = 0; $pop_45 = 0; $pop_46 = 0; $pop_47 = 0; $pop_48 = 0;
$pop_49 = 0; $pop_50 = 0; $pop_51 = 0; $pop_52 = 0; 


my $input_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/01_minor_alleles/filtered_split_compute_minor_alleles/";
my $output_dir = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/02_allele_frequency/filtered_split_make_frequency_table/";

my $population = "All26";

#my $output_amp1 = "$output_dir"."$population"."_amp1_p_sites".".txt";
#my $output_amp2 = "$output_dir"."$population"."_amp2_p_sites".".txt";
#my $output_amp3 = "$output_dir"."$population"."_amp3_p_sites".".txt";
#my $output_amp4 = "$output_dir"."$population"."_amp4_p_sites".".txt";
#my $output_amp5 = "$output_dir"."$population"."_amp5_p_sites".".txt";
#my $output_amp6 = "$output_dir"."$population"."_amp6_p_sites".".txt";
#my $output_amp7 = "$output_dir"."$population"."_amp7_p_sites".".txt";
#my $output_amp8 = "$output_dir"."$population"."_amp8_p_sites".".txt";
my $output_amp9 = "$output_dir"."$population"."_amp9_p_sites".".txt";
#my $output_amp10 = "$output_dir"."$population"."_amp10_p_sites".".txt";
#my $output_amp11 = "$output_dir"."$population"."_amp11_p_sites".".txt";
#my $output_amp12 = "$output_dir"."$population"."_amp12_p_sites".".txt";

#open(OUT, ">$output_amp1");
#open(OUT, ">$output_amp2");
#open(OUT, ">$output_amp3");
#open(OUT, ">$output_amp4");
#open(OUT, ">$output_amp5");
#open(OUT, ">$output_amp6");
#open(OUT, ">$output_amp7");
#open(OUT, ">$output_amp8");
open(OUT, ">$output_amp9");
#open(OUT, ">$output_amp10");
#open(OUT, ">$output_amp11");
#open(OUT, ">$output_amp12");

#my $input_amp1 = "$input_dir"."$population"."_amp1_minor_alleles.txt";
#my $input_amp2 = "$input_dir"."$population"."_amp2_minor_alleles.txt";
#my $input_amp3 = "$input_dir"."$population"."_amp3_minor_alleles.txt";
#my $input_amp4 = "$input_dir"."$population"."_amp4_minor_alleles.txt";
#my $input_amp5 = "$input_dir"."$population"."_amp5_minor_alleles.txt";
#my $input_amp6 = "$input_dir"."$population"."_amp6_minor_alleles.txt";
#my $input_amp7 = "$input_dir"."$population"."_amp7_minor_alleles.txt";
#my $input_amp8 = "$input_dir"."$population"."_amp8_minor_alleles.txt";
my $input_amp9 = "$input_dir"."$population"."_amp9_minor_alleles.txt";
#my $input_amp10 = "$input_dir"."$population"."_amp10_minor_alleles.txt";
#my $input_amp11 = "$input_dir"."$population"."_amp11_minor_alleles.txt";
#my $input_amp12 = "$input_dir"."$population"."_amp12_minor_alleles.txt";

#open (amp1, "<$input_amp1") or die "Cannot open amp1\n";
#open (amp2, "<$input_amp2") or die "Cannot open amp2\n";
#open (amp3, "<$input_amp3") or die "Cannot open amp3\n";
#open (amp4, "<$input_amp4") or die "Cannot open amp4\n";
#open (amp5, "<$input_amp5") or die "Cannot open amp5\n";
#open (amp6, "<$input_amp6") or die "Cannot open amp6\n";
#open (amp7, "<$input_amp7") or die "Cannot open amp7\n";
#open (amp8, "<$input_amp8") or die "Cannot open amp8\n";
open (amp9, "<$input_amp9") or die "Cannot open amp9\n";
#open (amp10, "<$input_amp10") or die "Cannot open amp10\n";
#open (amp11, "<$input_amp11") or die "Cannot open amp11\n";
#open (amp12, "<$input_amp12") or die "Cannot open amp12\n";

while (my $amp9 = <amp9>){
	
	if ($amp9 =~ /position/){
		next;
	}

	chomp($amp9);	#get rid of newline character
	@info =  split('\s', $amp9);
	
	$position = $info[0];
	
	# All 26 Alleles 
	
		if($info[1] == 1)	{	$pop_1++;	}
		elsif($info[1] == 2){	$pop_2++;	}
		elsif($info[1] == 3){	$pop_3++;	}
		elsif($info[1] == 4){	$pop_4++;	}
		elsif($info[1] == 5){	$pop_5++;	}
		elsif($info[1] == 6){	$pop_6++;	}
		elsif($info[1] == 7){	$pop_7++;	}
		elsif($info[1] == 8){	$pop_8++;	}
		elsif($info[1] == 9){	$pop_9++;	}
		elsif($info[1] == 10){	$pop_10++;	}
		elsif($info[1] == 11){	$pop_11++;	}
		elsif($info[1] == 12){	$pop_12++;	}
		elsif($info[1] == 13){	$pop_13++;	}
		elsif($info[1] == 14){	$pop_14++;	}
		elsif($info[1] == 15){	$pop_15++;	}
		elsif($info[1] == 16){	$pop_16++;	}
		elsif($info[1] == 17){	$pop_17++;	}
		elsif($info[1] == 18){	$pop_18++;	}
		elsif($info[1] == 19){	$pop_19++;	}
		elsif($info[1] == 20){	$pop_20++;	}
		elsif($info[1] == 21){	$pop_21++;	}
		elsif($info[1] == 22){	$pop_22++;	}
		elsif($info[1] == 23){	$pop_23++;	}
		elsif($info[1] == 24){	$pop_24++;	}
		elsif($info[1] == 25){	$pop_25++;	}
		elsif($info[1] == 26){	$pop_26++;	}
		elsif($info[1] == 27){	$pop_27++;	}
		elsif($info[1] == 28){	$pop_28++;	}
		elsif($info[1] == 29){	$pop_29++;  }
		elsif($info[1] == 30){	$pop_30++;	}
		elsif($info[1] == 31){	$pop_31++;	}
		elsif($info[1] == 32){	$pop_32++;	}
		elsif($info[1] == 33){	$pop_33++;	}
		elsif($info[1] == 34){	$pop_34++;	}
		elsif($info[1] == 35){	$pop_35++;	}
		elsif($info[1] == 36){	$pop_36++;	}
		elsif($info[1] == 37){	$pop_37++;	}
		elsif($info[1] == 38){	$pop_38++;	}
		elsif($info[1] == 39){	$pop_39++;	}
		elsif($info[1] == 40){	$pop_40++;	}
		elsif($info[1] == 41){	$pop_41++;	}
		elsif($info[1] == 42){	$pop_42++;	}
		elsif($info[1] == 43){	$pop_43++;	}
		elsif($info[1] == 44){	$pop_44++;	}
		elsif($info[1] == 45){	$pop_45++;	}
		elsif($info[1] == 46){	$pop_46++;	}
		elsif($info[1] == 47){	$pop_47++;	}
		elsif($info[1] == 48){	$pop_48++;	}
		elsif($info[1] == 49){	$pop_49++;	}
		elsif($info[1] == 50){	$pop_50++;	}
		elsif($info[1] == 51){	$pop_51++;	}
		elsif($info[1] == 52){	$pop_52++;	}

}

# -------------------------------------------------------------------------------------
#		Compute p
# -------------------------------------------------------------------------------------

	my $p1_52 = 1/52;			
	my $p2_52 = 2/52;			
	my $p3_52 = 3/52;			
	my $p4_52 = 4/52;			
	my $p5_52 = 5/52;			
	my $p6_52 = 6/52;			
	my $p7_52 = 7/52;			
	my $p8_52 = 8/52;			
	my $p9_52 = 9/52;			
	my $p10_52 = 10/52;			
	my $p11_52 = 11/52;			
	my $p12_52 = 12/52;			
	my $p13_52 = 13/52;			
	my $p14_52 = 14/52;			
	my $p15_52 = 15/52;			
	my $p16_52 = 16/52;
	my $p17_52 = 17/52;
	my $p18_52 = 18/52;
	my $p19_52 = 19/52;			
	my $p20_52 = 20/52;			
	my $p21_52 = 21/52;			
	my $p22_52 = 22/52;			
	my $p23_52 = 23/52;			
	my $p24_52 = 24/52;			
	my $p25_52 = 25/52;
	my $p26_52 = 26/52;
	my $p27_52 = 27/52;
	my $p28_52 = 28/52;			
	my $p29_52 = 29/52;			
	my $p30_52 = 30/52;			
	my $p31_52 = 31/52;			
	my $p32_52 = 32/52;			
	my $p33_52 = 33/52;			
	my $p34_52 = 34/52;
	my $p35_52 = 35/52;
	my $p36_52 = 36/52;
	my $p37_52 = 37/52;			
	my $p38_52 = 38/52;			
	my $p39_52 = 39/52;			
	my $p40_52 = 40/52;			
	my $p41_52 = 41/52;			
	my $p42_52 = 42/52;			
	my $p43_52 = 43/52;
	my $p44_52 = 44/52;
	my $p45_52 = 45/52;
	my $p46_52 = 46/52;			
	my $p47_52 = 47/52;			
	my $p48_52 = 48/52;			
	my $p49_52 = 49/52;			
	my $p50_52 = 50/52;
	my $p51_52 = 51/52;
	my $p52_52 = 52/52;	
	
	
	print OUT "$p1_52\t$pop_1\n";
	print OUT "$p2_52\t$pop_2\n";
	print OUT "$p3_52\t$pop_3\n";
	print OUT "$p4_52\t$pop_4\n";
	print OUT "$p5_52\t$pop_5\n";
	print OUT "$p6_52\t$pop_6\n";
	print OUT "$p7_52\t$pop_7\n";
	print OUT "$p8_52\t$pop_8\n";
	print OUT "$p9_52\t$pop_9\n";
	print OUT "$p10_52\t$pop_10\n";
	print OUT "$p11_52\t$pop_11\n";
	print OUT "$p12_52\t$pop_12\n";
	print OUT "$p13_52\t$pop_13\n";
	print OUT "$p14_52\t$pop_14\n";
	print OUT "$p15_52\t$pop_15\n";
	print OUT "$p16_52\t$pop_16\n";
	print OUT "$p17_52\t$pop_17\n";
	print OUT "$p18_52\t$pop_18\n";
	print OUT "$p19_52\t$pop_19\n";
	print OUT "$p20_52\t$pop_20\n";
	print OUT "$p21_52\t$pop_21\n";
	print OUT "$p22_52\t$pop_22\n";
	print OUT "$p23_52\t$pop_23\n";
	print OUT "$p24_52\t$pop_24\n";
	print OUT "$p25_52\t$pop_25\n";
	print OUT "$p26_52\t$pop_26\n";
	print OUT "$p27_52\t$pop_27\n";
	print OUT "$p28_52\t$pop_28\n";
	print OUT "$p29_52\t$pop_29\n";
	print OUT "$p30_52\t$pop_30\n";
	print OUT "$p31_52\t$pop_31\n";
	print OUT "$p32_52\t$pop_32\n";
	print OUT "$p33_52\t$pop_33\n";
	print OUT "$p34_52\t$pop_34\n";
	print OUT "$p35_52\t$pop_35\n";
	print OUT "$p36_52\t$pop_36\n";
	print OUT "$p37_52\t$pop_37\n";
	print OUT "$p38_52\t$pop_38\n";
	print OUT "$p39_52\t$pop_39\n";
	print OUT "$p40_52\t$pop_40\n";
	print OUT "$p41_52\t$pop_41\n";
	print OUT "$p42_52\t$pop_42\n";
	print OUT "$p43_52\t$pop_43\n";
	print OUT "$p44_52\t$pop_44\n";
	print OUT "$p45_52\t$pop_45\n";
	print OUT "$p46_52\t$pop_46\n";
	print OUT "$p47_52\t$pop_47\n";
	print OUT "$p48_52\t$pop_48\n";
	print OUT "$p49_52\t$pop_49\n";
	print OUT "$p50_52\t$pop_50\n";
	print OUT "$p51_52\t$pop_51\n";
	print OUT "$p52_52\t$pop_52\n";

close (amp9);
print "amp9 is done\n";
