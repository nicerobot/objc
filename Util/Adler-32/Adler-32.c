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
