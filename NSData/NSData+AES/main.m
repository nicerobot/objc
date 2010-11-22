//
//  main.h
//  NSData+AES
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
#import "NSData+AES/NSData+AESValue.h"
#import "NSData+AES/NSMutableData+AES.h"
#import "NSData+Output/NSData+Output.h"

void usage(int argc, char *argv[]) {
  printf("Usage: %s [OPTIONS] [value]\n", argv[0]);
}

int main(int argc, char *argv[])
{
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  @try {
    int c=0;
    BOOL ascii = FALSE;
    NSData *key = nil;
    
    while (c>=0)
    {
      static struct option long_options[] =
      {
        {"ascii",  no_argument,       0, 'a'},
        {"help",   no_argument,       0, 'h'},
        {"key",    required_argument, 0, 'k'},
        {0, 0, 0, 0}
      };
      /* getopt_long stores the option index here. */
      int option_index = 0;
      
      c = getopt_long (argc, argv, "ahk:",
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

        case 'a':
          ascii = TRUE;
          break;

        case '?':
          /* getopt_long already printed an error message. */
        case 'h':
          usage(argc,argv);
          return 0;
          break;
          
        case 'k':
          key = [NSData dataWithBytes:optarg length:strlen(optarg)];
          break;
          
        default:
          return 0;
      }
    }
    
    if (!key || optind >= argc) {
      usage(argc,argv);
      return 1;
    }

    for (;optind < argc; optind++) {
      NSMutableData *val = [NSMutableData dataWithBytes:argv[optind]
                                                 length:strlen(argv[optind])];
      [val encryptInPlace:key];
      if (ascii) {
        puts([val descriptionAsHexUTF8String]);
      } else {
        [val writeToStandardOut];
      }
    }
  }
  @finally {
    [pool drain];
    
  }
  
  return 0;
}
