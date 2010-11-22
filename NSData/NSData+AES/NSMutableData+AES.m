//
//  NSMutableData+AES.m
//  
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#import "NSMutableData+AES.h"

@implementation NSMutableData (AES)

-(NSData*) encryptInPlace:(NSData*) key {
  [self setData:[self encrypt:key withPadding:kCCOptionPKCS7Padding]];
  return key;
}

-(NSData*) encryptInPlace:(NSData*) key withPadding:(CCOptions)options {
  [self setData:[self encrypt:key withPadding:options]];
  return key;
}

-(NSData*) decryptInPlace:(NSData*) key {
  [self setData:[self decrypt:key withPadding:kCCOptionPKCS7Padding]];
  return key;
}

- (NSData*) decryptInPlace:(NSData *)key withPadding:(CCOptions)options {
  [self setData:[self decrypt:key withPadding:options]];
  return key;
}

@end
