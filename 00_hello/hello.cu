/* hello.cu */
#include <stdio.h>

__global__ void hello_world(void) {
    printf("GPU: Hello, world!\n");
}

int main(int argc, char *argv[]) {
    printf("CPU: Hello, world!\n");
    hello_world<<<1, 10>>>();
    /*
    cudaError_t error_code = cudaGetLastError();
    if (error_code != cudaSuccess) {
        printf("CUDA Error: %s", cudaGetErrorString(error_code));
        exit(EXIT_FAILURE);
    }
    cudaDeviceSynchronize();
    */
    cudaDeviceReset();
    return 0;
}