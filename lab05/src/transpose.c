#include "transpose.h"

/* The naive transpose function as a reference. */
void transpose_naive(int n, int blocksize, int *dst, int *src) {
    for (int x = 0; x < n; x++) {
        for (int y = 0; y < n; y++) {
            dst[y + x * n] = src[x + y * n];
        }
    }
}

/* Implement cache blocking below. You should NOT assume that n is a
 * multiple of the block size. */
void transpose_blocking(int n, int blocksize, int *dst, int *src) {
    for (int x = 0; x < n; x += blocksize) {
        for (int y = 0; y < n; y += blocksize) {
            for (int inner_x = x; inner_x < x + blocksize; inner_x++) {
                for (int inner_y = y; inner_y < y + blocksize; inner_y++) {
                    dst[inner_y + inner_x * n] = src[inner_x + inner_y * n];
                }
            }
        }
    }
}