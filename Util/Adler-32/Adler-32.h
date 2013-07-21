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



#include <stdint.h>

uint32_t adler32_update(uint32_t ck, const char data);
uint32_t adler32(const char *data, int data_len);
uint32_t adler32_fast(const char *data, int data_len);
uint32_t adler32_file(FILE *fp);
uint32_t adler32_file_update(uint32_t ck, FILE *fp);
uint32_t adler32_filename(const char *fn);
uint32_t adler32_filename_update(uint32_t ck, const char *fn);
