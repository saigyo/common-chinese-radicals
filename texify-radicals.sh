#!/bin/bash -v
tr "\t" "&" < 100-most-common-radicals.txt | gsed -E -e s/$/\\\\nl/ > 100-most-common-radicals.inc
