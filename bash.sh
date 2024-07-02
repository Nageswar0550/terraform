#!/bin/bash
for i in 'ls -lr'{
    cd $!;
    terraform destroy -auto-approve;
    cd ..; }
