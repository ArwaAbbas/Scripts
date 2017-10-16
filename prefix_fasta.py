import argparse
from Bio import SeqIO

def command_line_arguments(argv):
    p = argparse.ArgumentParser(description="Add prefix to FASTA identifier")
    p.add_argument("input_fasta", type=argparse.FileType('r'))
    p.add_argument("output_fasta", type=argparse.FileType('w'))
    p.add_argument("--separator", type=str, default=".",
        help="string used to separate id and prefix")
    p.add_argument("--prefix", type=str, required=True, 
        help="string used as a prefix")

    return p.parse_args(argv)

def add_prefix(input_fasta, output_fasta, prefix):
    for record in SeqIO.parse(input_fasta, "fasta"):
        len_id = len(record.id)
        record.id = prefix + record.id
        # description has id as part of it by BioPython Spec
        # need to remove it to avoid duplication of id in id and description
        record.description = record.description[len_id + 1:]
        SeqIO.write(record, output_fasta, "fasta")

def main(argv=None):
    args = command_line_arguments(argv)
    prefix_sep = args.prefix + args.separator
    add_prefix(args.input_fasta, args.output_fasta, prefix_sep)

if __name__=="__main__":
    main()
