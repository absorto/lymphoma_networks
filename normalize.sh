#!/bin/bash

echo $1
cd $1
/usr/bin/R --vanilla < /media/e/lymphoma_networks/normalize.R
