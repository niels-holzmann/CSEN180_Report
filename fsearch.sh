#!/bin/sh


start=$(date +%s%N)


#commands to take
cd home/Hazard3Vec
#find . -name "hazard3_rvfi_wrapper.v"
#find . -name "vadd32_vv.v"
#time find . \( -name "Makefile" -o -name "*main.c" \)
#time find /mnt/c/Users/royal/Documents/Github/Hazard3Vec \( -name "Makefile" -o -name "*main.c" \)
time find /mnt/c/Users/royal/Documents/Github/Hazard3Vec -name "hazard3_rvfi_wrapper.v"


end=$(date +%s%N)


duration_ns=$((end - start))


duration_ms=$((duration_ns / 1000000))
duration_us=$((duration_ns / 1000))


echo "Time taken in milliseconds: $duration_ms"
echo "Time taken in microseconds: $duration_us"
echo "Time taken in nanoseconds: $duration_ns"
