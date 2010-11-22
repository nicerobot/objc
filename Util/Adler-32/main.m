//
//  main.m
//  Adler-32
//
//  Created by Robert Nix on 2010.08.11.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

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
