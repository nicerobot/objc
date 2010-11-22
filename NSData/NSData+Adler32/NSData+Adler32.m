//
//  NSData+Adler32.m
//  Bases
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#import "NSData+Adler32.h"
#import "Adler-32.h"

@implementation NSData (Adler32)

-(uint32_t) adler32 {
  return adler32_fast([self bytes], [self length]);
}

@end
