//
//  NSString+Bases.m
//  Bases
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <CommonCrypto/CommonHMAC.h>
#import "NSData+dataConvertedToBase/NSData+dataConvertedToBase.h"
#import "NSString+stringConvertedToBase.h"

@implementation NSString (stringConvertedToBase)

-(NSString*) toBase:(int) base withPadding:(BOOL) pad {
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
  return [data toBase:base withPadding:pad];
}

-(NSString*) toBase:(int) base {
  return [self toBase:base withPadding:true];
}

-(NSString*) toBase2 { return [self toBase:2 withPadding:true]; }
-(NSString*) toBase8 { return [self toBase:8 withPadding:true]; }
-(NSString*) toBase16 { return [self toBase:16 withPadding:true]; }
-(NSString*) toBase32 { return [self toBase:32 withPadding:true]; }
-(NSString*) toBase64 { return [self toBase:64 withPadding:true]; }
-(NSString*) toBase94 { return [self toBase:94 withPadding:true]; }

-(NSString*) toBetterBase64 {
  NSMutableString *result = (NSMutableString*) [self toBase:64 withPadding:true];
  NSRange range = NSMakeRange(0, [result length]);
  [result replaceOccurrencesOfString:@"+" withString:@"." options:0 range:range];
  [result replaceOccurrencesOfString:@"/" withString:@"-" options:0 range:range];
  [result replaceOccurrencesOfString:@"=" withString:@"_" options:0 range:range];
  return result;
}

-(NSString*) toBase2withPadding:(BOOL) pad { return [self toBase:2 withPadding:pad]; }
-(NSString*) toBase8withPadding:(BOOL) pad { return [self toBase:8 withPadding:pad]; }
-(NSString*) toBase16withPadding:(BOOL) pad { return [self toBase:16 withPadding:pad]; }
-(NSString*) toBase32withPadding:(BOOL) pad { return [self toBase:32 withPadding:pad]; }
-(NSString*) toBase64withPadding:(BOOL) pad { return [self toBase:64 withPadding:pad]; }
-(NSString*) toBase94withPadding:(BOOL) pad { return [self toBase:94 withPadding:pad]; }

@end

