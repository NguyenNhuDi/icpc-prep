#!/bin/bash

chmod +x run.sh
for i in ./*.zip; do
    p_name="${i%.zip}"
    mkdir ${p_name}
    mkdir ${p_name}/out
    cp t.cpp ${p_name}/${p_name}.cpp
    cp t.py ${p_name}/${p_name}.py
    cp run.sh ${p_name}/run.sh
    unzip ${i} -d ${p_name}
done
