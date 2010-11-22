//
//  NSData+AES.m
//  This NSData represents the data to en/decrypt. The key is passed in.
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#import "NSData+AESValue.h"

@implementation NSData (AESValue)

-(NSData*) encryptWithKey:(NSData*) key {
  return [self encrypt:key withPadding:kCCOptionPKCS7Padding];
}

-(NSData*) encryptWithKey:(NSData*) key usingPadding:(CCOptions)options {
  return [self encrypt:key withPadding:options];
}

-(NSData*) decryptWithKey:(NSData*) key {
  return [self decrypt:key withPadding:kCCOptionPKCS7Padding];
}

- (NSData *)decryptWithKey:(NSData *)key usingPadding:(CCOptions)options {
  return [self decrypt:key withPadding:options];
}

@end
