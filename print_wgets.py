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


for acc in experiments:
    stump = list(acc)
    stump.pop()
    stump.pop()
    stump.pop()
    stump = "".join(stump) + "nnn"

    print "echo downloading series matrix for %s" % acc
    print "wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/%s/%s/matrix/*" % (stump,acc)

    print "echo downloading family xml for %s" % acc
    print "wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/%s/%s/miniml/%s_family.xml.tgz" % (stump,acc,acc)

    print "echo downloading family soft for %s" % acc
    print "wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/%s/%s/soft/%s_family.soft.gz" % (stump,acc,acc)
