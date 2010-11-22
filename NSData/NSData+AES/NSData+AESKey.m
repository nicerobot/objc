//
//  NSData+AES.m
//  This NSData represents the AES key. Data to en/decrypt is passed in.
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#import "NSData+AESKey.h"

@implementation NSData (AESKey)

-(NSData*) encryptValue:(NSData*) value {
  return [value encrypt:self withPadding:kCCOptionPKCS7Padding];
}

-(NSData*) encryptValue:(NSData*) value usingPadding:(CCOptions)options {
  return [value encrypt:self withPadding:options];
}

-(NSData*) decryptValue:(NSData*) value {
  return [value decrypt:self withPadding:kCCOptionPKCS7Padding];
}

- (NSData *)decryptValue:(NSData *) value usingPadding:(CCOptions)options
{
  return [value decrypt:self withPadding:options];
}

@end
