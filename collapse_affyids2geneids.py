import argparse
import sys
import csv
import numpy as np
import pprint

parser = argparse.ArgumentParser(description='discard affy ids, keep gene ids')

parser.add_argument('--exprs', type=argparse.FileType('r'), required=True, help="expression matrix")
parser.add_argument('--collapsed', type=argparse.FileType('w'), default=sys.stdout)
parser.add_argument('--method', choices=['max','median'], default='max')
             
args = parser.parse_args()


def collapse_max(matrix):
    result = []
    a = np.array(matrix)
    for n in range(0,len(a[0])):
        result.append(np.max(a[0:,n]))
    return result
        
def collapse_median(matrix):
    result = []
    a = np.array(matrix)
    for n in range(0,len(a[0])):
        result.append(np.median(a[0:,n]))
    return result

expr_reader = csv.reader(args.exprs, delimiter=",", quotechar='"')

# grab cels columns header
cels = expr_reader.next()[2:]    


# group expression rows by gene id
exprs = {}
for l in expr_reader:
    affy_id = l[0]
    gene_id = l[1]

    if gene_id in exprs:
        exprs[gene_id].append([np.float(v) for v in l[2:]])
    else:
        exprs[gene_id] = [[np.float32(v) for v in l[2:]],]

# write them out collapsed
outwriter = csv.writer(args.collapsed, delimiter='\t', quoting=csv.QUOTE_MINIMAL)
outwriter.writerow( ["gene_id", ] + cels )
for gene_id in sorted(exprs.keys()):
    if args.method == 'median':
        collapsed = collapse_median( exprs[gene_id] )
    elif args.method == 'max':
        collapsed = collapse_max( exprs[gene_id] )        
    outwriter.writerow( [gene_id, ] + collapsed)

