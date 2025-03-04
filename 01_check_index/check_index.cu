/* check_dimension.cu */
#include <stdio.h>
#include <cuda_runtime.h>

__global__ void checkIndex(void) {
    printf("threadIdx: (%d, %d, %d)\n"
           "blockIdx:  (%d, %d, %d)\n"
           "blockDim:  (%d, %d, %d)\n"
           "gridDim:   (%d, %d, %d)\n\n",
            threadIdx.x, threadIdx.y, threadIdx.z,
            blockIdx.x, blockIdx.y, blockIdx.z,
            blockDim.x, blockDim.y, blockDim.z,
            gridDim.x, gridDim.y, gridDim.z);
}

int main(int argc, char *argv[]) {
    // 假定的要处理的元素总数
    int nElem = 6;
    dim3 block(3);
    // (nElem + block.x - 1) / block.x 是一种数学技巧
    // 实际原理是通过向上取整来获得要使用的grid数量:
    // 1. 当nElem能被block.x整除时, 
    //      (nElem + block.x - 1) / block.x = nElem / block.x 
    // 2. 不能整除时, 
    //      (nElem + block.x - 1) / block.x = nElem / block.x + 1

    dim3 grid((nElem + block.x - 1) / block.x);

    printf("grid.x: %d, grid.y: %d, grid.z: %d\n", grid.x, grid.y, grid.z);
    printf("block.x: %d, block.y: %d, block.z: %d\n", block.x, block.y, block.z);
    checkIndex<<<grid, block>>>();
    cudaDeviceReset();
    return 0;
}