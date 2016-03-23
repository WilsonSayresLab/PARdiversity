from sys import argv
import csv

script, input_file, output_file, counts_file = argv

# end_PAR = 27
# start_XTR = 
# end_XTR =
# start_PAR2 = 
# total_length = 

with open(input_file, 'rU') as IN:
	raw_data = list(csv.reader(IN, delimiter = '\t'))
	
for row, i in enumerate(raw_data):
	if row[2] == 'NA':
		if i < length_PAR:
			end_PAR -= 1
			start_XTR -= 1
			end_XTR -= 1
			start_PAR2 -= 1
			total_length -= 1
		elif i < start_XTR:
			start_XTR -= 1
			end_XTR -= 1
			start_PAR2 -= 1
			total_length -= 1
		elif