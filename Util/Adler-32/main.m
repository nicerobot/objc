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



#import "main.h"

int main(int argc, char *argv[])
{
  BOOL tty_used = 0; // TODO How to continue reading from stdin?

  for (int i=0; i<argc; i++) {

    uint32_t ck = 1;

    if (i && 0 != strncmp(argv[i], "--", 2)) {
      ck = adler32_filename(argv[i]);
    } else {
      if (tty_used || (!i && isatty(0))) {
        continue;
      }
      ck = adler32_file(stdin);
      tty_used = 1;
    }

    printf("%ld %s\n", (long int) ck, i ? argv[i] : "--");
  }
  return 0;
}
