//
//  NSString+Adler32.m
//  Bases
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#import "NSString+Adler32.h"
#import "Adler-32.h"

@implementation NSString (Adler32)

-(uint32_t) adler32 {
  NSUInteger len = [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
  return adler32_fast([self UTF8String], len);
}

@end
