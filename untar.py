from lymphomas import subtipos

for subtipo in subtipos:
    for plataforma in subtipos[subtipo]:
        for experimento in subtipos[subtipo][plataforma]:
            print "cd data/%s" % experimento
            print "tar --wildcards -xvf %s_RAW.tar %s*" % (experimento, "* ".join(subtipos[subtipo][plataforma][experimento]))
            print "cd -"
