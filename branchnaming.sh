#!/bin/bash

branch_name=$(git symbolic-ref --short HEAD)

if [[ "$branch_name" =~ ^[a-z] ]]; then
  echo "Error: Branch name should start with an uppercase letter."
  exit 1
fi
