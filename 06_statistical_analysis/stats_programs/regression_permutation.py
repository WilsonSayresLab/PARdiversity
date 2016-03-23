from sys import argv
import csv
import random

script, input_file, output_file = argv
#-----------------------------------------------------------------
#Sets the indexes that define the borders of the X-chromosomes regions.
PAR1_start = 0
PAR1_end = 27

XTR_start = 882
XTR_end = 932

PAR2_start = 1550
PAR2_end = -1
#-----------------------------------------------------------------
def permute_and_store(list_x):
	"""Takes as input an input file with columns start, end and pi
	and shuffles the pi column to calculate the average pi within 
	the designated windows"""
	flag = True
	for i in range(29):
		OUT.write(list_x[i] + '\t')
	OUT.write(list_x[29])
	OUT.write('\n')
	random.shuffle(list_x)
	# while flag == True:
		# if 'NA' in list_x:
			# random.shuffle(list_x)
		# else:
			# flag = False
	
	
# Opens the input file and reads the diversity values to an array.
with open(input_file, 'rU') as f:
	position_list = list(csv.reader(f, delimiter = '\t'))

pi_values = []
for i in position_list:
	pi_values.append(i[2])

with open(output_file, 'w') as OUT:
	for i in range(10001):
		permute_and_store(pi_values)

