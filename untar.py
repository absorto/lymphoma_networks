from lymphomas import subtipos

for subtipo in subtipos:
    for plataforma in subtipos[subtipo]:
        for experimento in subtipos[subtipo][plataforma]:
            print "mkdir -p data/%s/%s" % (subtipo, experimento)
            print "cd data/%s/%s" % (subtipo, experimento)
            print "tar --wildcards -xvf ../../%s/%s_RAW.tar %s*" % (experimento,experimento, "* ".join(subtipos[subtipo][plataforma][experimento]))
            print "cd -"
