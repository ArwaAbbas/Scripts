import sys
import re
import os

readFile = sys.argv[1]

inRead = open(readFile, 'r')

acDict = {}

for line in inRead:
	acString = (line.split(None,11)[1])
	#print acString
	ac = (acString.split('|')[3])
	#print ac
	if ac in acDict:
		host = acDict[ac]
		#print "Host is already known"
	else:
		#print 'esearch -db nucleotide -query ' + ac + ' | efetch -format gb - mode text | grep -e "/lab_host=" -e "/host=" -A 1'
		os.system('esearch -db nucleotide -query ' + ac + ' | efetch -format gb - mode text | grep -e "/lab_host=" -e "/host=" -A 1 > temp_ac.txt')
		#os.system('esearch -db nucleotide -query ' + ac + ' | efetch -format gb - mode text | grep -e "/lab_host=" -e "/host=" -A 1') 
		#os.system('head temp_ac.txt')
		with open('temp_ac.txt', 'r') as f:
    			if os.stat('temp_ac.txt').st_size != 0:
				#print " ".join(line.strip() for line in f)
				#host = f.readline()
				info = " ".join(line.strip() for line in f)
				host = (info.split('"')[1])
				#print info + "\t" + host
				acDict[ac] = host
			else:
				host = "No Host Available"
				acDict[ac] = host
				#acDict[ac] = "No Host Available"
	print ac + "\t" + host		

inRead.close()

