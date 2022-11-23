# cumemalloc_junks
**author: wuichak**

- this project attempts to create plenty naive junk program, to block gpu memroy and stuck there before timeout.
- cumalloc.cu is a simple cuMemAlloc code, which will alloc arround 10M gpu-memory, then take a nap.
- use build.sh to compile the code.

- junky_runner.sh is the script for creating plenty junky program at once
  - ./junky_runner.sh <num_junks> <timeout_in_second>
  
enjoy!
