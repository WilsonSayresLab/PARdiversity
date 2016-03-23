This set of programs is used to filter and split the original dataset.

The 04_filter.CGS.data.pl is used to filter the CGS data for all 26 females with respect 	to: microsattelites, repeated elements, and genes.

		Input_01 = CGS.All26.txt

		Input_02 = 02_galaxy_chrX_data/filtered_chrX.interval
		
		Output = Output_Files

Once the data is filtered, it needs to be split into the nonPAR, PAR1, PAR2, and XTR regions:

	The program 05_split.CGS.data.by.PAR.pl separates the data into regions.

		Input = filtered.CGS.All26.txt

		Output = Output_Files

	The XTR should be split from the filtered data using 06_split.xtr.pl

		Input = ~/output_files/filtered.cgs.all26.txt

		Output = Output_Files

Simultaneously, the unfiltered data also needs to be split into these regions:

	To split the PARs and nonPAR for the unfiltered data, use the program 			02_unfiltered_split.CGS.data.by.PAR.pl.

		Input = CGS.All26.txt

		Output = Output_Files

	The XTR should be split from the filtered data using 03_unfiltered_split.xtr.pl

		Input = CGS.All26.txt

		Output = Output_Files

The data is also split so that the XTR is not included in the nonPAR.

	The program 07_split.CGS.data.by.PAR.nonPAR.noXTR.pl separates the data into 		regions excluding the XTR from the nonPAR.

		Input = filtered.CGS.All26.txt

		Output = Output_Files

	

