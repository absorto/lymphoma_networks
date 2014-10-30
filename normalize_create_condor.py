from lymphomas import subtipos

print "executable     = normalize.sh"

for subtipo in subtipos:
    for plataforma in subtipos[subtipo]:
        for experimento in subtipos[subtipo][plataforma]:
            print "Arguments = /media/e/lymphoma_networks/data/%s/%s %s" % (subtipo, experimento, plataforma)
            print "output    = norm$(Process).out"
            print "error     = norm$(Process).error"
            print "universe  = vanilla"
            print "Queue"


