#!/bin/bash

for tmax in $(ls -1 -- *_tmax.csv); do cat $tmax; done >>TMAX.csv
for tmin in $(ls -1 -- *_tmin.csv); do cat $tmin; done >>TMIN.csv
for prcp in $(ls -1 -- *_prcp.csv); do cat $prcp; done >>PRCP.csv
