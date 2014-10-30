import argparse
import sys
import csv

parser = argparse.ArgumentParser(description='metanormalize normalized expression levels from different platforms')

parser.add_argument('--exprs', type=argparse.FileType('r'), nargs="+", required=True, help="output of eset")
parser.add_argument('--outfile', type=argparse.FileType('w'), default=sys.stdout)

args = parser.parse_args()


for f in args.exprs:
    expr_reader = csv.reader(f, delimiter=",", quotechar='"')

    for l in expr_reader:
        affy_id = l[0]
        gene_id = l[1]

        print gene_id
