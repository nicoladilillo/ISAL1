#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

// #define DEBUG

#define N 9
#define M 50

// function definition
unsigned long long int convert(char n[M]) {
    unsigned long long int dec = 0;
    int i;
    int max = strlen(n)-1;

    #ifdef DEBUG
    printf("\nCONV INSIDE:%s - ", n);
    #endif
    for(i = 0; i <= max; i++) {
        #ifdef DEBUG
        printf("%c", n[i]);
        #endif
        if (n[i] == '1')
            dec += pow(2, max-i);
    }

    #ifdef DEBUG
    printf("\nCONV: %s --> %llu ", n, dec);
    #endif
    return dec;
}

int main() {

    FILE *fp = NULL;
    fp = fopen("partial_product_stage4.txt", "r");
    if (fp == NULL) {
        printf("ERRORE apertura file\n");
        return -1;
    }

    char partial_s[N][M];
    unsigned long long int partial[N];
    unsigned long long int sum = 0;
    int i;
    for (i = 0; i < N; i++) {
        fscanf(fp, "%s", &partial_s[i]);
        partial[i] = convert(partial_s[i]);
    }

    sum = sum + (partial[0]);
    sum = sum + (partial[1]);
    sum = sum + (partial[2] << 2);
    sum = sum + (partial[3] << 4);
    sum = sum + (partial[4] << 6);
    sum = sum + (partial[5] << 8);
    sum = sum + (partial[6] << 45);
    sum = sum + (partial[7] << 44);
    sum = sum + (partial[8] << 43);
    
    printf("\n\nFINE: %llu\n", sum);

    fclose(fp);
    return 0;
}