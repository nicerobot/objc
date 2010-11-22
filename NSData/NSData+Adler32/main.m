//
//  main.h
//  NSData+Adler32
//
//  Created by Robert Nix on 2010.21.11.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <stdio.h>
#import <stdlib.h>
#import <getopt.h>
#include <pwd.h>
#include <unistd.h>

#import "main.h"
#import "NSData+Adler32/NSData+Adler32.h"

void usage(int argc, char *argv[]) {
  printf("Usage: %s [OPTIONS] [value]\n", argv[0]);
}

int main(int argc, char *argv[])
{
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  @try {
    int c=0;
    
    while (c>=0)
    {
      static struct option long_options[] =
      {
        {"help",   no_argument,       0, 'h'},
        {0, 0, 0, 0}
      };
      /* getopt_long stores the option index here. */
      int option_index = 0;
      
      c = getopt_long (argc, argv, "h",
                       long_options, &option_index);
      
      switch (c)
      {
        case -1:
          break;
          
        case 0:
          /* If this option set a flag, do nothing else now. */
          if (long_options[option_index].flag != 0)
            break;
          printf ("option %s", long_options[option_index].name);
          if (optarg)
            printf (" with arg %s", optarg);
          printf ("\n");
          break;

        case '?':
          /* getopt_long already printed an error message. */
        case 'h':
          usage(argc,argv);
          return 0;
          break;
          
        default:
          return 0;
      }
    }
    
    if (optind >= argc) {
      usage(argc,argv);
      return 1;
    }

    for (;optind < argc; optind++) {
      NSData *val = [NSData dataWithBytes:argv[optind] 
                                   length:strlen(argv[optind])];
      printf("%d\n", [val adler32]);
    }
  }
  @finally {
    [pool drain];
    
  }
  
  return 0;
}
