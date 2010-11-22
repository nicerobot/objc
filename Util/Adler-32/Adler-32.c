/*
 *  Adler-32.c
 *  Adler-32
 *
 *  Created by Robert Nix on 2010.23.09.
 *  Copyright 2010 nicerobot.org. All rights reserved.
 *
 * http://en.wikipedia.org/wiki/Adler-32
 *
 */
#include <stdio.h>
#include "Adler-32.h"

#define MOD_ALDER 65521
#define BUFFER_SIZE 1000

uint32_t adler32_update(uint32_t ck, const char data) {
  uint32_t a = ck & 0x0ffff, b = (ck >> 16) & 0x0ffff;
  a = (a + data) % MOD_ALDER;
  b = (b + a) % MOD_ALDER;
  return (b << 16) | a;
}

uint32_t adler32(const char *data, int data_len) {
  uint64_t ck = 1;
  for(int i=0; i<data_len; i++) {
    ck = adler32_update(ck,data[i]);
  }
  return ck;
}

uint32_t adler32_fast(const char *data, int data_len) {
  uint32_t a = 1, b = 0;
  for(int i=0; i<data_len; i++) {
    a = (a + data[i]) % MOD_ALDER;
    b = (b + a) % MOD_ALDER;
  }
  return (b << 16) | a;
}

uint32_t adler32_file(FILE *fp) {
  return adler32_file_update(1,fp);
}

uint32_t adler32_file_update(uint32_t ck, FILE *fp) {
  int bytes_read = 0;
  char buf[BUFFER_SIZE];
  do {
    bytes_read = fread(buf, 1, sizeof(buf), fp);
    for (int i=0; i<bytes_read; i++) {
      ck = adler32_update(ck, buf[i]);
    }
  } while ( BUFFER_SIZE == bytes_read);
  return ck;
}

uint32_t adler32_filename(const char *fn) {
  return adler32_filename_update(1,fn);
}

uint32_t adler32_filename_update(uint32_t ck, const char *fn) {
  FILE *fp = fopen(fn,"r");  
  if (fp) {
    ck = adler32_file_update(ck,fp);
    fclose(fp);
  }
  return ck;
}
