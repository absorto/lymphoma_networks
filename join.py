import argparse
import csv
import sys

parser = argparse.ArgumentParser(description='join to TSV files by their first column')

parser.add_argument('--files', type=argparse.FileType('r'), nargs="+", required=True, help="files to join")
parser.add_argument('--joined', type=argparse.FileType('w'), default=sys.stdout)

args = parser.parse_args()


gids = {}
cels = {}
exprs = {}
for f in args.files:
    expr_reader = csv.reader(f, delimiter="\t", quotechar='"')
    cels[f.name] = expr_reader.next()[1:]    
    gids[f.name] = []
    exprs[f.name] = {}
    for l in expr_reader:
        gene_id = l[0]
        gids[f.name].append(gene_id)
        exprs[f.name][gene_id] = l[1:]

    gids[f.name] = set(gids[f.name])

gene_ids = list(set.intersection(*gids.values()))


outwriter = csv.writer(args.joined, delimiter='\t', quoting=csv.QUOTE_MINIMAL)

for gene_id in sorted(gene_ids):
    row = [gene_id,]
    for f in exprs:
        row += exprs[f][gene_id]
    outwriter.writerow( row )
        

