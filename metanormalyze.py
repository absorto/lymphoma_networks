import argparse
import sys
import csv
import numpy as np

parser = argparse.ArgumentParser(description='metanormalize normalized expression levels from different platforms')

parser.add_argument('--exprs', type=argparse.FileType('r'), nargs="+", required=True, help="output of eset")
parser.add_argument('--normalized', type=argparse.FileType('w'), default=sys.stdout)
parser.add_argument('--joined', type=argparse.FileType('w'))

args = parser.parse_args()


gids = {}
cels = {}
exprs = {}
for f in args.exprs:
    expr_reader = csv.reader(f, delimiter=",", quotechar='"')
    cels[f.name] = expr_reader.next()[2:]    
    gids[f.name] = []
    exprs[f.name] = {}
    for l in expr_reader:
        affy_id = l[0]
        gene_id = l[1]
        gids[f.name].append(gene_id)
        exprs[f.name][gene_id] = l[2:]

    gids[f.name] = set(gids[f.name])
    gene_ids = list(set.intersection(*gids.values()))


esets = {}
esets_norm = {}
for e in exprs.keys():
    esets[e] = []
    for gid in gene_ids:
        esets[e].append([np.float32(val) for val in exprs[e][gid]])
    esets[e] = np.array(esets[e])
    esets_norm[e] = (esets[e] - np.mean(esets[e])) / np.std(esets[e])


eset = np.concatenate(esets.values(), axis=1)
eset_norm = np.concatenate(esets_norm.values(), axis=1)


header = [ "gene_id", ] + [val for sublist in [cels[e] for e in exprs.keys()] for val in sublist]

gene_ids_bak = list(gene_ids)
outwriter = csv.writer(args.normalized, delimiter='\t', quotechar='"', quoting=csv.QUOTE_MINIMAL)
outwriter.writerow(header)
for row in eset_norm:
    gid = gene_ids.pop(0)
    outwriter.writerow([gid,] + list(row))

    
if args.joined:
    w = csv.writer(args.joined, delimiter="\t", quotechar='"', quoting=csv.QUOTE_MINIMAL)
    w.writerow(header)
    for row in eset:
        gid = gene_ids_bak.pop(0)
        w.writerow([gid,] + list(row))
