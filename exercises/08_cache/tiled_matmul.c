#include <stdio.h>

#define size 16
#define t_size 1

int input0[256] = {
 01, 00, 04, 02, 01, 04, 00, 02, 00, 01, 00, 00, 01, 01, 00, 00,
 00, 04, 02, 03, 02, 01, 03, 01, 01, 03, 04, 02, 04, 00, 01, 04,
 03, 04, 00, 02, 02, 04, 04, 03, 01, 01, 03, 00, 04, 02, 01, 03,
 01, 01, 04, 04, 01, 03, 03, 00, 04, 02, 03, 00, 04, 03, 03, 03,
 01, 04, 00, 02, 04, 01, 03, 01, 04, 04, 01, 00, 03, 03, 01, 01,
 00, 04, 01, 04, 01, 02, 00, 01, 01, 03, 00, 04, 04, 01, 02, 03,
 01, 03, 01, 03, 02, 00, 01, 03, 01, 00, 03, 02, 04, 00, 02, 02,
 00, 02, 01, 01, 00, 01, 03, 04, 02, 00, 02, 02, 03, 04, 01, 03,
 00, 03, 02, 00, 00, 02, 03, 04, 04, 02, 02, 04, 04, 00, 02, 00,
 04, 03, 03, 01, 00, 01, 01, 00, 01, 01, 04, 04, 03, 01, 03, 00,
 04, 03, 00, 01, 04, 00, 00, 02, 00, 01, 00, 04, 03, 01, 04, 04,
 03, 01, 01, 03, 01, 04, 01, 02, 03, 03, 03, 03, 03, 01, 04, 01,
 02, 00, 01, 02, 02, 02, 00, 01, 02, 00, 00, 03, 01, 02, 01, 04,
 02, 02, 00, 04, 00, 03, 04, 02, 02, 01, 04, 01, 01, 03, 03, 02,
 02, 02, 01, 04, 04, 01, 02, 04, 04, 01, 01, 00, 00, 01, 00, 04,
 01, 01, 00, 04, 00, 04, 00, 02, 03, 00, 02, 04, 01, 00, 03, 00,
};
int input1[256] = {
 00, 03, 02, 03, 02, 01, 01, 04, 01, 01, 01, 03, 00, 02, 01, 01,
 01, 00, 01, 01, 04, 01, 00, 00, 02, 00, 03, 04, 03, 04, 02, 02,
 04, 04, 04, 00, 01, 00, 04, 02, 04, 01, 04, 04, 04, 01, 02, 03,
 03, 03, 03, 01, 03, 04, 04, 00, 00, 01, 00, 01, 04, 03, 00, 00,
 04, 01, 00, 00, 03, 04, 00, 01, 01, 02, 04, 04, 01, 00, 03, 04,
 00, 00, 01, 03, 00, 03, 02, 03, 01, 03, 03, 03, 01, 01, 04, 01,
 03, 03, 04, 03, 02, 04, 01, 02, 02, 01, 04, 01, 01, 03, 03, 04,
 03, 03, 02, 02, 04, 02, 03, 02, 03, 01, 00, 01, 02, 02, 04, 00,
 04, 02, 04, 02, 03, 00, 00, 03, 03, 00, 02, 01, 02, 01, 02, 03,
 01, 01, 02, 01, 04, 01, 02, 01, 02, 03, 02, 03, 03, 01, 03, 00,
 02, 02, 00, 04, 03, 01, 02, 03, 04, 01, 01, 01, 02, 03, 03, 02,
 02, 02, 00, 03, 00, 03, 01, 00, 00, 01, 01, 02, 04, 04, 03, 02,
 03, 03, 01, 03, 00, 04, 00, 04, 00, 00, 01, 03, 01, 00, 00, 00,
 00, 03, 00, 02, 04, 03, 00, 03, 02, 00, 04, 00, 02, 01, 04, 02,
 00, 00, 00, 00, 02, 01, 01, 01, 03, 02, 02, 03, 03, 01, 00, 00,
 01, 04, 01, 03, 01, 01, 01, 02, 02, 01, 04, 00, 03, 02, 02, 02,
};

int expected_result[256] = {
 36, 39, 35, 27, 31, 37, 41, 37, 32, 26, 40, 45, 39, 22, 43, 23,
 76, 76, 54, 72, 76, 75, 49, 60, 64, 37, 79, 75, 86, 72, 72, 58,
 65, 77, 55, 85, 83, 87, 44, 82, 64, 39, 84, 76, 67, 70, 85, 58,
 81, 90, 73, 75, 81, 79, 58, 85, 78, 41, 94, 77, 90, 61, 76, 64,
 70, 61, 55, 57, 92, 74, 29, 62, 58, 34, 82, 73, 67, 53, 75, 60,
 57, 60, 41, 56, 62, 71, 42, 44, 41, 34, 62, 71, 85, 62, 58, 36,
 64, 62, 38, 56, 62, 63, 39, 50, 49, 24, 49, 60, 66, 57, 51, 39,
 58, 73, 44, 67, 67, 65, 35, 62, 58, 21, 66, 43, 65, 57, 73, 48,
 74, 63, 57, 68, 66, 63, 41, 62, 64, 31, 61, 71, 74, 63, 75, 50,
 51, 61, 40, 64, 57, 53, 40, 61, 57, 29, 57, 75, 70, 64, 56, 45,
 50, 62, 27, 56, 63, 67, 28, 52, 44, 34, 66, 75, 69, 57, 57, 44,
 64, 69, 54, 76, 76, 75, 54, 75, 65, 48, 67, 81, 82, 65, 76, 45,
 42, 56, 31, 48, 41, 50, 29, 45, 34, 25, 54, 41, 54, 40, 51, 39,
 56, 71, 54, 76, 82, 75, 50, 68, 66, 37, 71, 56, 74, 72, 76, 51,
 75, 74, 61, 56, 84, 64, 46, 56, 59, 32, 70, 55, 68, 57, 72, 58,
 46, 42, 36, 53, 47, 55, 42, 42, 39, 31, 35, 50, 63, 54, 51, 28,
};

int result[256];


void matmul(int* A, int* B, int* C){
    for (int y=0; y<size;y=y + t_size){
        for (int x=0; x<size; x = x + t_size){
            C[x+size*y] = 0;
	    for (int k=0; k<size;k++){
	      for(int tx=0; tx<t_size;tx++){
	        for(int ty=0; ty<t_size;ty++){
                  C[x+tx + size*(y+ty)] += A[k + size * (y+ty)] * B[x+tx + size*k];
		}
	      }
            }
        }
    }
}

int check_result(int* a, int* b){
    int correct = 1;
    for(int i=0; i<size*size;i++){
         if (a[i] != b[i])
            correct = 0;
    }
    return correct;
}


int  main(){
    matmul(input0, input1, result);
    int c = check_result(result, expected_result);
    printf("Check: %d\n", c);
    return 0;
}

