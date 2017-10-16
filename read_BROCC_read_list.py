import sys

readFile = sys.argv[1]
BlastFile = sys.argv[2]
resultFile = sys.argv[3]


inRead = open(readFile, 'r')

readSet = set()
for line in inRead:
	readSet.add(line.strip('\n'))
#print len(readSet)	
inRead.close()	

with open(BlastFile, 'r') as Blast:
	outFile = open(resultFile, 'w')
	for item in Blast:
		if not item.startswith('#'):
			read = item.split(None, 1)[0]
			#print read
			if read in readSet:
					result = item.rstrip()
					#print result
					outFile.write(result + '\n')
outFile.close()


