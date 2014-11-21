import argparse
import csv
import networkx as nx

parser = argparse.ArgumentParser(description='grab first neighbors of given keys from imported network')
parser.add_argument('--adj_in', type=argparse.FileType('r'), required=True, help="aracne adj file")
parser.add_argument('--de_genes', type=argparse.FileType('r'), required=True, help="de matrix file")
parser.add_argument('--pickleout', type=argparse.FileType('w'), required=True, help="pickle output")
args = parser.parse_args()


G = nx.read_edgelist(args.adj_in, data=(('w',float),))

de_reader = csv.reader(args.de_genes, delimiter=",", quotechar='"')

header = de_reader.next()

keep = set()
for row in de_reader:
    gene_id = row[0]
    for n in G.neighbors( gene_id ):
        keep.add(n)


for gene_id in G.nodes():
    if not gene_id in keep:
        G.remove_node(gene_id)


nx.write_gpickle(G, args.pickleout)
