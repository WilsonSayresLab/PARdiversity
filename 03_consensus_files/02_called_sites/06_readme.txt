These programs will calculate the number of called sites per window for filtered or non-filtered mask files by counting the number of 0's. 

---------------------------------

Input Masks:

(non_filtered)

#	my $input_file = "$input_dir"."mask.all_females.chr."."$chr".".txt";
#	my $input_file = "$input_dir"."mask.9_Afr_females.chr."."$chr".".txt";
#	my $input_file = "$input_dir"."mask.5_Eur_females.chr."."$chr".".txt";

(filtered)

#	my $input_file = "$input_dir"."filtered.mask.all_females.chr."."$chr".".txt";
#	my $input_file = "$input_dir"."filtered.mask.9_Afr_females.chr."."$chr".".txt";
#	my $input_file = "$input_dir"."filtered.mask.5_Eur_females.chr."."$chr".".txt";

---------------------------------

Interval Input: 

#	my $intervals = 02_galaxy_chrX_data/chrX_1Mbwindow_nonoverlapping.txt

#	my $intervals = 02_galaxy_chrX_data/chrX_1Mbwindow_overlapping100kb.txt

#	my $intervals = 02_galaxy_chrX_data/chrX_100kbwindow_nonoverlapping.txt

#	my $intervals = 02_galaxy_chrX_data/chrX_100kbwindow_overlapping10kb.txt
	
