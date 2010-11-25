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

-(NSString*) descriptionAsCharacters:(BOOL)encodeNonPrintable {
  NSMutableString *result = [NSMutableString stringWithCapacity:[self length]*2];
  int l = [self length];
  const char *b = [self bytes];
  for (int i=0; i<l; i++) {
    if (encodeNonPrintable && ! isprint(b[i])) {
      [result appendFormat:@"\t%02x",(unsigned char)b[i]];
    } else {
      [result appendFormat:@"%c",b[i]];
    }
  }
  return result;
}

-(NSString*) descriptionAsCharacters {
  return [self descriptionAsCharacters:true];
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
