/*
 *  Adler-32.h
 *  Adler-32
 *
 *  Created by Robert Nix on 2010.23.09.
 *  Copyright 2010 nicerobot.org. All rights reserved.
 *
 */

#include <stdint.h>

uint32_t adler32_update(uint32_t ck, const char data);
uint32_t adler32(const char *data, int data_len);
uint32_t adler32_fast(const char *data, int data_len);
uint32_t adler32_file(FILE *fp);
uint32_t adler32_file_update(uint32_t ck, FILE *fp);
uint32_t adler32_filename(const char *fn);
uint32_t adler32_filename_update(uint32_t ck, const char *fn);
