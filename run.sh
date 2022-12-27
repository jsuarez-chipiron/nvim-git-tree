#!/bin/bash

cd cpp/build
if make > /dev/null
then
    echo "COMPILED OK"
    ./main fake_root
fi
