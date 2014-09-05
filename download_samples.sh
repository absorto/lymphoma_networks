
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
done


wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE43nnn/GSE43677/matrix/${ACC}_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE43nnn/GSE43677/miniml/${ACC}_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE43nnn/GSE43677/soft/${ACC}_family.soft.gz


wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE43nnn/GSE43677/matrix/GSE43677_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE43nnn/GSE43677/miniml/GSE43677_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE43nnn/GSE43677/soft/GSE43677_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE57nnn/GSE57611/matrix/GSE57611_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE57nnn/GSE57611/miniml/GSE57611_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE57nnn/GSE57611/soft/GSE57611_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE53nnn/GSE53786/matrix/GSE53786_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE53nnn/GSE53786/miniml/GSE53786_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE53nnn/GSE53786/soft/GSE53786_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE53nnn/GSE53820/matrix/GSE53820_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE53nnn/GSE53820/miniml/GSE53820_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE53nnn/GSE53820/soft/GSE53820_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE55nnn/GSE55267/matrix/GSE55267_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE55nnn/GSE55267/miniml/GSE55267_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE55nnn/GSE55267/soft/GSE55267_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE37nnn/GSE37088/matrix/GSE37088_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE37nnn/GSE37088/miniml/GSE37088_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE37nnn/GSE37088/soft/GSE37088_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE26nnn/GSE26673/matrix/GSE26673_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE26nnn/GSE26673/miniml/GSE26673_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE26nnn/GSE26673/soft/GSE26673_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE48nnn/GSE48435/matrix/GSE48435_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE48nnn/GSE48435/miniml/GSE48435_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE48nnn/GSE48435/soft/GSE48435_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE42nnn/GSE42867/matrix/GSE42867_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE42nnn/GSE42867/miniml/GSE42867_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE42nnn/GSE42867/soft/GSE42867_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE17nnn/GSE17189/matrix/GSE17189_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE17nnn/GSE17189/miniml/GSE17189_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE17nnn/GSE17189/soft/GSE17189_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE35nnn/GSE35163/matrix/GSE35163_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE35nnn/GSE35163/miniml/GSE35163_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE35nnn/GSE35163/soft/GSE35163_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE12nnn/GSE12453/matrix/GSE12453_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE12nnn/GSE12453/miniml/GSE12453_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE12nnn/GSE12453/soft/GSE12453_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE4nnn/GSE4732/matrix/GSE4732_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE4nnn/GSE4732/miniml/GSE4732_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE4nnn/GSE4732/soft/GSE4732_family.soft.gz

wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE4nnn/GSE4475/matrix/GSE4475_series_matrix.txt.gz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE4nnn/GSE4475/miniml/GSE4475_family.xml.tgz
wget -t 0 -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE4nnn/GSE4475/soft/GSE4475_family.soft.gz


