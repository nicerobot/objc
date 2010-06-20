//
//  NSData+dataWithContentsOfString.m
//  Bases
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#import <CommonCrypto/CommonHMAC.h>
#import "NSData+dataWithContentsOfString.h"

@implementation NSData (dataWithContentsOfString)

+(NSData*) dataWithContentsOfString:(NSString*) str {
  if (!str) return nil;
  int len = [str length];
  if (!len) return nil;
  NSMutableData *data = [NSMutableData dataWithCapacity:len];
  // The unichars are extracted character by character and only when they are > 255 will they
  // push multiple bytes to the data.
  // This essentially means that any string containing characters > 255 will not produce
  // a base conversion capable of being reversed.
  for (unsigned int i=0; i<len; i++) {
    const unichar c = [str characterAtIndex:i];
    const unsigned char u = 0x00ff&(c>>8);
    if (u) [data appendBytes:&u length:1];
    const unsigned char l = 0x00ff&c;
    [data appendBytes:&l length:1];
  }
  return data;
}

@end
