#!usr/bin/perl -w
use strict;
use warnings;

#----------------------------------------------------------------------------------
my $usage = "create_temp_files_26_females.pl";
#this program will make temp files of sorted filtered CGS data for all 26 females based on 1 Mb non overlapping windows and position along the X chromosome
#---------------------------------------------------------------------------------
my $count = 0;

my $window = "5Mbwindow_nonoverlapping";

my $interval_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/";

my $input_interval = "$interval_directory"."chrX_"."$window".".txt";

my $cg_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/Output_Files/filtered.CGS.All26.txt";

my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/04_temps/nonoverlapping/5Mb_filtered/";


open my $CG, "<", $cg_input or die "can't open $cg_input\n";
my @SNPs = map { [ (split '\s+')[3], $_ ] } <$CG>;
close($CG);
            
open my $INTERVAL, "<", $input_interval or die "can't open $input_interval\n"; 
#my $interval = <$INTERVAL>; # skip first line
foreach (<$INTERVAL>){
    chomp;
    my( $start, $end ) = split /\t/;
    open my $OUT, ">", $output_directory."temp_file_".$count++.".txt";    
    print $OUT map { $_->[1] } grep { $start <= $_->[0] and $_->[0] <= $end } @SNPs; 
    close $OUT;
}
close($INTERVAL);