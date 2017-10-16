#### Description: Parses CIGAR and MD:Z tags to calculate alignment % for each read
#### Written by: Kevin McCormick (kevinmcc@upenn.edu)
#### Created 2017 04 06

# set -e
#set -u
#set -x

BAM=$1

function cutCigar {
	REF=$1
	CIGAR=$2
	MDZ=$3
	NUMMATCHES=0
	NUMTOTAL=0
	while read X; do
		NUM=${X:0:-1}
		CHAR=${X: -1}
		case ${CHAR} in
			"M") NUMMATCHES=$((${NUMMATCHES}+${NUM})); NUMTOTAL=$((${NUMTOTAL}+${NUM}));;
			[DI]) NUMTOTAL=$((${NUMTOTAL}+${NUM}));;
			*) ;;
		esac
	done < <(echo ${CIGAR} | grep -o -P '([0-9]+)([A-Z])')
	MISMATCHES=$(echo ${MDZ} | grep -o '[ACGT]' | wc -l)
	NUMMATCHES=$((${NUMMATCHES}-${MISMATCHES}))
	RATIO=`echo "${NUMMATCHES} / ${NUMTOTAL}" | bc -l`
	echo ${REF} ${NUMMATCHES} ${NUMTOTAL} ${RATIO}
}

cmd="samtools view ${BAM} | cut -f 3,6,13 | while read line; do cutCigar \$line; done"
eval ${cmd}
