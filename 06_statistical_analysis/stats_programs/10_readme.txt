This directory contains miscellanious programs that can be used to analyze the final data.
These programs were used to analyze the significance of the regression. 

regression_permutation.py and regression_permutation_5Mb.py

These are used to permute the nonoverlapping data and print out the first 30 (or 50 for the second program) windows for each regression.
The format of the output is 10001 unlabled lines of text that are tab delimited. 
The first line is the original data and the rest are the first 30/50 windows for every random regression. 

permute_pval.R and permute_pval_5Mb.R

These files take the previous data as input and analyze the corelations and significance of each regression. 
These files are not meant to be run in one go and should instead be run chunk by chunk inside of R studio. 
These can be used to look at a comparison of the original coefficient of correlation and p-value compared to those values of the 10,000 permutations. 

correlation_plot.R

This data takes as input the filtered data with the windows and the pi values (nonoverlapping is best)
The programs can be used to create a graph with the extent of significant linear regressions colored red compared to the rest of the data.
The program works by taking a linear regression of the first x windows (can be adjusted in the loop in the program) and then shifting by 1 window in each direction.
This program should be run chunk by chunk in R studio. 

Na_remover.py

This program takes as input the raw data and filters and adjusts our region counts in order to find the proper number of windows for the PAR, XTR and nonPAR.
It outputs the NA_removed data and the start and end counts for the regions.