#!/bin/bash

#  directory where this script is
cd "$(dirname "$0")"

# Navigate to project directory
cd hashstore || { echo " hashstore directory not found!"; exit 1; }




if [ ! -f Makefile ]; then
  echo " Running cmake..."
  cmake ..
fi

# Build 
echo " Building HashStore..."
make

# Run
echo " Running HashStore..."
./hashstore
