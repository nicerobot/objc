//
//  NSData+Output.m
//  Bases
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#import "NSData+Output.h"

@implementation NSData (Output)

-(NSString*) descriptionAsHex {
  NSMutableString *result = [NSMutableString stringWithCapacity:[self length]*2];
  int l = [self length];
  const unsigned char *b = [self bytes];
  for (int i=0; i<l; i++) {
    [result appendFormat:@"%02X",b[i]];
  }
  return result;
}

-(const char*) descriptionAsHexUTF8String {
  return [[self descriptionAsHex] UTF8String];
}

-(NSString*) descriptionAsCharacters {
  NSMutableString *result = [NSMutableString stringWithCapacity:[self length]*2];
  int l = [self length];
  const char *b = [self bytes];
  for (int i=0; i<l; i++) {
    [result appendFormat:@"%c",b[i]];
  }
  return result;
}

-(void) writeToFilePointer:(FILE*) fp{
  int l = [self length];
  const unsigned char *b = [self bytes];
  for (int i=0; i<l; i++) {
    putc(b[i],fp);
  }
}

-(void) writeToStandardOut {
  [self writeToFilePointer:stdout];
}

@end
