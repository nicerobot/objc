/*
 *  anybase.c
 *  Admittance
 *
 *  Created by Robert C. Nix on 10/04/14.
 *  Copyright 2010 nicerobot.org. All rights reserved.
 *
 */


#include <string.h>
#include <stdio.h>
#include <stdint.h>

#define SIZE 8

uint32_t divideBy(uint32_t * number, int base) {
  uint32_t r = 0;
  uint32_t d;
  for (int i=0; i<SIZE; ++i) {
    d = (number[i] + r*0x100000000) / base;
    r = (number[i] + r*0x100000000) % base;
    number[i] = d;
  }
  return r;
}

int zero(uint32_t* number) {
  for (int i=0; i<SIZE; ++i) {
    //printf("%i %016X\n",i,number[i]);
    if (number[i] != 0) {
      return 0;
    }
  }
  return 1;
}

void swap(char *a, char *b) {
  char tmp = *a;
  *a = *b;
  *b = tmp;
}

void reverse(char *str) {
  int x = strlen(str);
  for (int y = 0; y < x/2; y++) {
    swap(&str[y],&str[x-y-1]);
  }
}

static char digits[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/";

void convertToBase(uint32_t* number, char* buf, int base) {
  int n = 0;
  do {
    int digit = divideBy(number,base);
    buf[n++] = digits[digit];
  } while(!zero(number));
  buf[n] = '\0';
  reverse(buf);
}

void test(int base) {
  uint32_t a[SIZE] = {0xffffffff,0xffffffff,0xffffffff,0xffffffff,0xffffffff,0xffffffff,0xffffffff,0xffffffff,};
  uint32_t b[SIZE] = {1,2,3,4,5,6,7,8};
  char buf[500];
  
  convertToBase(a, buf, base);
  printf("%2d : %s\n",base,buf);
  convertToBase(b, buf, base);
  printf("%2d : %s\n",base,buf);
}
