#!/bin/sh
set -x
ORG=scivm
for dockerfile in `find . -name Dockerfile`
do
   # get the base directory
   dir=$(dirname ${dockerfile})
   dir2=${dir#"."}
   # docker_compile.pl takes 3 arguments: 
   #   [0] directory where docker file exists
   #   [1] repository name
   #   [2] tag name
   echo "Running command: perl -X ./docker-compile.pl $dir $ORG$dir2 latest"
   nohup time perl -X ./docker-compile.pl $dir $ORG$dir2 latest > ./$dir2.log 2<&1 &
done
