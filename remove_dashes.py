import sys

inFile = sys.argv[1]
outFile = sys.argv[2]

with open(inFile, 'r') as fin:
	with open(outFile, 'w') as fout:
		for line in fin:
			if line.startswith('>'):
                		fout.write(line)
			else:
                		fout.write(line.translate(None, '-'))

	fout.close()
fin.close()
