#!/bin/bash
for i in `ls`
do
cd $i
`terraform plan`
cd ..
done
