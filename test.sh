#!/bin/bash
START_DIR=$(pwd)
SOURCE_DIR=$1
cd "$SOURCE_DIR"
echo "Source Dir: ""$SOURCE_DIR"

rm -rf test_cases
git clone https://github.com/hasherezade/bearparser_tests.git
mv bearparser_tests test_cases

BCMD_DIR=$(pwd)/build/

cd test_cases
chmod +x test1.sh
./test1.sh "$BCMD_DIR" "info" "x64/QtGui4"
if [[ "$?" != 0 ]]; then
	exit 1
fi
./test1.sh "$BCMD_DIR" "winfo0" "x64/QtGui4"
if [[ "$?" != 0 ]]; then
	exit 1
fi
echo "All passed"
cd "$START_DIR"