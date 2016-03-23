These programs use the unfiltered and filtered data from all 26 females and calculates the  confidence intervals and P_values using bootstrap analysis. 

The usage of the programs:

perl compute_95_boostrap_chrX.pl [input_file]
perl compute_p_boostrap_chrX.pl [input_file]

Input files must be of the type:
Start	End	pi
And they must not contain headers.

Output will print to the same directory as the input file.
The start and end windows of the regions that are hardcoded into the programs can be found in the interval_ranges folder. 

The stats_programs contains other miscellaneous programs that can be used to analyze the final data and analyze the significance of the regression.