import sys
from Bio import SeqIO

FastaFile = open(sys.argv[1], 'rU')

for seq_record in SeqIO.parse(FastaFile, "fasta"):
	name = seq_record.id
	length = len(seq_record)
	print(name+"\t"+str(length))

FastaFile.close()
