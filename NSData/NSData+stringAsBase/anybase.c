/* * Objective-C Augments - A small, miscellaneous set of Objective-C String and Data
 * augmentations
 * Copyright (C) 2011- nicerobot
 *
 * This file is part of Objective-C Augments.
 *
 * Objective-C Augments is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Objective-C Augments is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Objective-C Augments.  If not, see <http://www.gnu.org/licenses/>.
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
  uint32_t a[8] = {0xffffffff,0xffffffff,0xffffffff,0xffffffff,0xffffffff,0xffffffff,0xffffffff,0xffffffff,};
  uint32_t b[8] = {1,2,3,4,5,6,7,8};
  uint32_t c[3] = {0x1,0x7f,0xff};
  char buf[500];
  
  convertToBase(a, buf, base);
  printf("%2d : %s\n",base,buf);
  convertToBase(b, buf, base);
  printf("%2d : %s\n",base,buf);
  convertToBase(c, buf, base);
  printf("%2d : %s\n",base,buf);
}

