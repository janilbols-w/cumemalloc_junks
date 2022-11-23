#include <stdio.h>
#include "cuda_runtime.h"
#include <iostream>
#include <unistd.h>
using namespace std;

#define CUDACHECK(cmd) do {                         \
  cudaError_t e = cmd;                              \
  if( e != cudaSuccess ) {                          \
    printf("Failed: Cuda error %s:%d '%s'\n",             \
        __FILE__,__LINE__,cudaGetErrorString(e));   \
    exit(EXIT_FAILURE);                             \
  }                                                 \
} while(0)

int main(int argc, char* argv[])
{
  //allocating and initializing device buffers
  int size = 10;
  int sleep_duration = 99999999;
  cout << "please input size (MB)\n" << endl;
  // cin >> size;
  cout << "default with " << size << " MB\n" << endl;
  int malloc_size = size *1024 *1024 /4;
  printf("receiving value %d, size with %d (floats)\n", size, malloc_size);
  float* sendbuff = (float*)malloc(sizeof(float*) );

  CUDACHECK(cudaMalloc(&sendbuff, malloc_size * sizeof(float)));
  // cout << "press any key to end" << endl;
  // char tmp[50];
  // cin >> tmp;
  sleep(sleep_duration);
  return 0;
}
