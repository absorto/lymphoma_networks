#!/bin/bash

echo $1
cd $1
/usr/bin/Rscript /media/e/lymphoma_networks/normalize.R $2
