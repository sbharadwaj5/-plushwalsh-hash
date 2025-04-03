#!/bin/bash

# Navigate to project root
cd "$(dirname "$0")"


cd hashstore

make


echo "Running HashStore..."
./hashstore
