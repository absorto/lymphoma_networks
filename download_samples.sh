
for ACC in  \
    GSE43677 \
    GSE57611 \
    GSE53786 \
    GSE53820 \
    GSE55267 \
    GSE37088 \
    GSE26673 \
    GSE48435 \
    GSE42867 \
    GSE17189 \
    GSE35163 \
    GSE12453 \
    GSE4732 \
    GSE4475
do
curl "http://www.ncbi.nlm.nih.gov/geo/download/?acc=${ACC}&format=file" > ${ACC}_RAW.tar
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE43nnn/GSE43677/matrix/${ACC}_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE43nnn/GSE43677/miniml/${ACC}_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE43nnn/GSE43677/soft/${ACC}_family.soft.gz
done

