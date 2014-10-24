import pycurl

experiments = [ 'GSE2350',
                'GSE4475',
                'GSE37088',
                'GSE55267',
                'GSE26673',
                'GSE48435',
                'GSE42867',
                'GSE17189',
                'GSE31312',
                'GSE57611',
                'GSE34171',
                'GSE43677',
                'GSE12195', ]


# get RAW TARs
for acc in experiments:
    print "downloading raw tar for %s" % acc
    with open("%s_RAW.tar" % acc, 'wb') as f:
        c = pycurl.Curl()
        c.setopt(c.URL, "http://www.ncbi.nlm.nih.gov/geo/download/?acc=%s&format=file" % acc)
        c.setopt(c.WRITEDATA, f)
        c.perform()
        c.close()



