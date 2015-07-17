#!/bin/bash

# Author    :	Abhishek S. Okheda <abhi.emailto@gmail.com>
# Purpose   :	Init Git repo
# Date	    :	Fri Jul 17 11:31:57 NPT 2015

mkdir -p .git .git/{refs,objects} 
echo "ref: refs/heads/master" > .git/HEAD
