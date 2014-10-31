import argparse
import sys
import csv

parser = argparse.ArgumentParser(description='convert aracne adjacency file to source,target,mi csv')

parser.add_argument('--adj_in', type=argparse.FileType('r'), required=True, help="aracne adj file")
# parser.add_argument('--csv_out', type=argparse.FileType('w'), default=sys.stdout)

args = parser.parse_args()

expr_reader = csv.reader(args.adj_in, delimiter="\t", quotechar='"')

for l in expr_reader:
    source = l[0]
    for n in range(1,len(l),2):
        target = l[n]
        mi     = l[n+1]
        print source,target,mi
