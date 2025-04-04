#!/bin/bash

# Navigate to the directory where this script lives
cd "$(dirname "$0")"

# Navigate to project directory
cd hashstore || { echo " hashstore directory not found!"; exit 1; }



# Run CMake if not already configured
if [ ! -f Makefile ]; then
  echo " Running cmake..."
  cmake ..
fi

# Build the project
echo " Building HashStore..."
make

# Run the executable
echo " Running HashStore..."
./hashstore
