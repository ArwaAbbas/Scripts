import argparse, math

def count_kmers(seq, k=3, kmers={}):
        '''
        Naievely counts kmers. Inefficient for large k. Returns a dict.
        '''
        
        for i in range(0, len(seq)-k):
                kmer = seq[i:i+k]
                try:
                        kmers[kmer] += 1
                except KeyError:
                        kmers[kmer] = 1
        return kmers

def check_complexity(k,kcount,len_raw,threshold=.55):
	'''
	Checks to see whether sequence complexity is above threshold.
	'''
	#print k,kcount,len_raw,threshold
	
	#seq_raw = seq.replace('\n','')
	expected = 4.0**k*(1.0-math.exp(-(4.0**(-1.0*k)) * len_raw)) #should implement Scott's suggestion
	#print kcount/expected, kcount, expected, k, len_raw
	if kcount/expected > .55:
		return True
	return False
	

if __name__ == "__main__":
	#grab args from user
	parser = argparse.ArgumentParser(description='Filter low-complexity sequences.')
	parser.add_argument('file', type=str, help='file in fasta format')
	parser.add_argument('k', type=int, help='kmer length')
	args = parser.parse_args()
	#read in files
	annotation = ''
	seq = []
	f_out = open(args.file+"_filtered.fa", "w")
	filtered = 0
	tot = 1 #start at one
	kmers = {}
	len_raw = 0
	with open(args.file, "r") as f_in:
		for line in f_in:
			#case first line
			if annotation == '':
				annotation = line
				continue
			#check if title			
			elif line[0] == ">":
				if tot % 500 == 0:
					print ("Completed",tot,"contigs.")
				tot += 1
				if check_complexity(args.k,len(kmers.keys()),len_raw):
					f_out.write(annotation)
					f_out.writelines(seq)
				else:
					filtered += 1
					#print tot, line
				annotation = '\n'+line
				kmers = {}
				len_raw = 0
				seq = []
			else: #keep adding to sequence
				kmers = count_kmers(line[:-1],args.k,kmers)
				len_raw += len(line)-1
				seq.append(line[:-1])
				#print kmers
			#print annotation
	#last sequence
	if check_complexity(args.k,len(kmers.keys()),len_raw):
		f_out.write(annotation)
		f_out.writelines(seq)
	else:
		filtered += 1
	
	f_out.close()
	print ("Filtered",filtered,"of",tot,"total contigs.")
