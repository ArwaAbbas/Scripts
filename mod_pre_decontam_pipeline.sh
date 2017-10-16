#!/bin/bash
set -x

# Input files
#These are used in the demultiplexing step
#FWD=small_R1.fastq
#REV=small_R2.fastq
#BC=small_barcode.txt

# Logging
log () {
    echo "$(date "+%Y-%m-%d %H:%M:%S") ${1}" >> time.log
}

# Output dirs
SUMMARY_DIR="Summary"
mkdir -p $SUMMARY_DIR


## Demultiplexing
#Not required for Nextera XT MiSeq Runs
#log "START:dnabc"
#DNABC_SUMMARY="$SUMMARY_DIR/summary-dnabc.json"
DNABC_OUTPUT_DIR="FASTQ"
#dnabc.py --forward-reads $FWD --reverse-reads $REV --barcode-file $BC \
	 --summary-file $DNABC_SUMMARY --output-dir $DNABC_OUTPUT_DIR
#log "FINISH:dnabc"


for DNABC_R1_FILE in $DNABC_OUTPUT_DIR/*_R1_001.fastq; do
    SAMPLE_R1=${DNABC_R1_FILE##*/}
    SAMPLE_R2=${SAMPLE_R1/_R1_001.fastq/_R2_001.fastq}
    SAMPLE_NAME=${SAMPLE_R1%%_R1_001.fastq}
    echo $SAMPLE_NAME

    ## Quality control
    log "START:illqc ${SAMPLE_NAME}"
    ILLQC_SUMMARY="$SUMMARY_DIR/summary-illqc_${SAMPLE_NAME}.json"
    ILLQC_OUTPUT_DIR="illqc_results"
    ILLQC_QC_OUTPUT_DIR="illqc_reports"
    illqc.py \
	--forward-reads "${DNABC_OUTPUT_DIR}/$SAMPLE_R1" \
	--reverse-reads "${DNABC_OUTPUT_DIR}/$SAMPLE_R2" \
	--output-dir $ILLQC_OUTPUT_DIR \
	--qc-output-dir $ILLQC_QC_OUTPUT_DIR \
	--summary-file $ILLQC_SUMMARY
    log "FINISH:illqc ${SAMPLE_NAME}"

    # We are done with the dnabc results and could delete them now
    # rm "${DNABC_OUTPUT_DIR}/$SAMPLE_R1"
    # rm "${DNABC_OUTPUT_DIR}/$SAMPLE_R2"

    ## Decontamination
    log "START:decontaminate ${SAMPLE_NAME}"
    DECONTAM_SUMMARY="${SUMMARY_DIR}/summary-decontam_${SAMPLE_NAME}.json"
    DECONTAM_OUTPUT_DIR="decontam_results"
    decontaminate.py \
	--forward-reads "$ILLQC_OUTPUT_DIR/$SAMPLE_R1" \
	--reverse-reads "$ILLQC_OUTPUT_DIR/$SAMPLE_R2" \
	--output-dir $DECONTAM_OUTPUT_DIR \
	--summary-file $DECONTAM_SUMMARY
    log "FINISH:decontaminate ${SAMPLE_NAME}"

    # We are done with the illqc results and could delete them now
    # rm "$ILLQC_OUTPUT_DIR/$SAMPLE_R1"
    # rm "$ILLQC_OUTPUT_DIR/$SAMPLE_R2"

done
