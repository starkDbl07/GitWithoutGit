#!/bin/bash

mkdir -p .git .git/{refs,objects} 
echo "ref: refs/heads/master" > .git/HEAD
