//
//  NSMutableData+AES.m
//  
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#import "cipher.h"
#import "NSMutableData+AES.h"

@implementation NSMutableData (AES)

-(NSData*) encryptInPlace:(NSData*) key {
  [self encryptInPlace:key withPadding:kCCOptionPKCS7Padding];
  return key;
}

-(NSData*) encryptInPlace:(NSData*) key withPadding:(CCOptions)options {
  [self setData:cipher(key,self,nil,kCCEncrypt,options,nil)];
  return key;
}

-(NSData*) decryptInPlace:(NSData*) key {
  [self decryptInPlace:key withPadding:kCCOptionPKCS7Padding];
  return key;
}

- (NSData*) decryptInPlace:(NSData *)key withPadding:(CCOptions)options {
  [self setData:  cipher(key,self,nil,kCCDecrypt,options,nil)];
  return key;
}

@end
