#!usr/bin/perl -w
use strict;
use warnings;

#----------------------------------------------------------------------------------
my $usage = "create_temp_files_26_females.pl";
#this program will make temp files of sorted CGS data for all 26 females based on 1 Mb non overlapping windows and position along the X chromosome
#---------------------------------------------------------------------------------
my $count = 0;

my $window = "1Mbwindow_nonoverlapping";
#my $window = "1Mbwindow_overlapping100kb";
#my $window = "100kbwindow_nonoverlapping";
#my $window = "100kbwindow_overlapping10kb";

my $interval_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/";

my $input_interval = "$interval_directory"."chrX_"."$window".".txt";

my $cg_input = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/01_CompleteGenomics/All26.females/01_CGS.All26.txt";

my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/04_temps/nonoverlapping/1Mb/";
#my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/04_temps/overlapping/1Mb/";
#my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/04_temps/nonoverlapping/100kb/";
#my $output_directory = "/Users/wilsonsayres_lab_admin/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/04_temps/overlapping/100kb/";


open my $CG, "<", $cg_input or die "can't open $cg_input\n";
my @SNPs = map { [ (split /\t/)[3], $_ ] } <$CG>; #store CGS data as chromosome locus (1st element) and the entire line of text corresponding to that locus (2nd element)
close($CG);
            
open my $INTERVAL, "<", $input_interval or die "can't open $input_interval\n"; 
#my $interval = <$INTERVAL>; # skip first line (This only exists because someone decided to just run with a faulty galaxy interval that had two first lines, don't worry about it.)
foreach (<$INTERVAL>){
    chomp;
    my( $start, $end ) = split /\t/;
    open my $OUT, ">", $output_directory."temp_file_".$count++.".txt";    
    print $OUT map { $_->[1] } grep { $start <= $_->[0] and $_->[0] <= $end } @SNPs; #search for all @SNP elements within the start ad end range established by the interval file.
    close $OUT;
}
close($INTERVAL);