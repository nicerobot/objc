//
//  NSString+Bases.m
//  Bases
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <CommonCrypto/CommonHMAC.h>
#import "NSData+stringAsBase/NSData+stringAsBase.h"
#import "NSString+stringAsBase.h"

@implementation NSString (stringAsBase)

-(NSString*) stringAsBase:(int) base withPadding:(BOOL) pad {
  int len = [self length];
  NSMutableData *data = [NSMutableData dataWithCapacity:len];
  // The unichars are extracted character by character and only when they are > 255 will they
  // push multiple bytes to the data.
  // This essentially means that any string containing characters > 255 will not produce
  // a base conversion capable of being reversed.
  for (unsigned int i=0; i<len; i++) {
    const unichar c = [self characterAtIndex:i];
    const unsigned char u = 0x00ff&(c>>8);
    if (u) [data appendBytes:&u length:1];
    const unsigned char l = 0x00ff&c;
    [data appendBytes:&l length:1];
  }
  return [data stringAsBase:base withPadding:pad];
}

-(NSString*) stringAsBase:(int) base {
  return [self stringAsBase:base withPadding:true];
}

-(NSString*) stringAsBase2 { return [self stringAsBase:2 withPadding:true]; }
-(NSString*) stringAsBase8 { return [self stringAsBase:8 withPadding:true]; }
-(NSString*) stringAsBase16 { return [self stringAsBase:16 withPadding:true]; }
-(NSString*) stringAsBase32 { return [self stringAsBase:32 withPadding:true]; }
-(NSString*) stringAsBase64 { return [self stringAsBase:64 withPadding:true]; }
-(NSString*) stringAsBase94 { return [self stringAsBase:94 withPadding:true]; }

-(NSString*) toBetterBase64 {
  NSMutableString *result = (NSMutableString*) [self stringAsBase:64 withPadding:true];
  NSRange range = NSMakeRange(0, [result length]);
  [result replaceOccurrencesOfString:@"+" withString:@"." options:0 range:range];
  [result replaceOccurrencesOfString:@"/" withString:@"-" options:0 range:range];
  [result replaceOccurrencesOfString:@"=" withString:@"_" options:0 range:range];
  return result;
}

-(NSString*) stringAsBase2withPadding:(BOOL) pad { return [self stringAsBase:2 withPadding:pad]; }
-(NSString*) stringAsBase8withPadding:(BOOL) pad { return [self stringAsBase:8 withPadding:pad]; }
-(NSString*) stringAsBase16withPadding:(BOOL) pad { return [self stringAsBase:16 withPadding:pad]; }
-(NSString*) stringAsBase32withPadding:(BOOL) pad { return [self stringAsBase:32 withPadding:pad]; }
-(NSString*) stringAsBase64withPadding:(BOOL) pad { return [self stringAsBase:64 withPadding:pad]; }
-(NSString*) stringAsBase94withPadding:(BOOL) pad { return [self stringAsBase:94 withPadding:pad]; }

@end

