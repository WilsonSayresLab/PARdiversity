All of this data was extracted from Galaxy.


The initial file that was uploaded in galaxy to get the windows, was 			ChrX_coordinates.txt. Output files:

	fltered_chrX_interval.txt
	
		Join, Subtract, Group >> Subtract >> ChrX_coordinates.txt >> subtract 			filter_out_region.txt, RefSeq genes, simple repeats, and repetitive 			elements

	chrX_window_.txt

		regional variation >> make windows >> ChrX_coordinates.txt >> windows 			size, and sliding start position (repeat for each desired window)

	filtered_subs_rates_window_genome.txt

		fetch alignments >> extract MAF blocks >> filtered_chrX_interval_original.txt >> 		select hg19 and either panTro4 or rheMac3 (repeat for both genomes)
		
		regional variation >> estimate substitution rates >> MAF blocks >> 			estimate rates corresponding to intervals in history >> chrX_window_txt >> 		(repeat for all windows and both genomes)

Create {chrX	start	end} files for each region (PAR1, PAR2, XTR, and nonPAR). 	region_coordinates.txt.

	filtered_subs_rates_region_genome.txt

		fetch alignments >> extract MAF blocks >> filtered_chrX_interval_original.txt >> select hg19 and either panTro4 or rheMac3 (repeat for both genomes)
		
		regional variation >> estimate substitution rates >> MAF blocks >> 			estimate rates corresponding to intervals in history >> 				region_coordinates.txt >> (repeat for all regions and both genomes)

	filtered_coverage_region_genome.txt

		fetch alignments >> MAF coverage stats >> region_coordinates.txt >> MAF 		source >> alignments in your history >> select MAF blocks >> type of 			output >> select summarize coverage

The same process can be repeated for the unfiltered data by using the 			ChrX_coordinates.txt instead of the filtered_chrX_interval_original.txt to extract the MAF 	blocks. 


The ChrX_coordinates_genome.txt files filter out the filter_out_region_genome.txt because those regions are found on different chromosomes in the alignment genomes than on the human genome. 

There are interval and substitution rate files that had regions of high divergence in the non recombining region (nonPAR) filtered out using both overlapping and non overlapping windows to do the filtering. 

There are interval files for the original filtered data, the data without the ampliconic and low diversity regions (filtered_chrX_interval.txt), only the ampliconic regions(filtered_chrX_interval_amp.txt), and only the low diversity regions(filtered_chrX_interval_low). 