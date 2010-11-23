//
//  NSData+AES.m
//  
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#include <CommonCrypto/CommonDigest.h>
#import "NSData+AES.h"
#import "cipher.h"

@implementation NSData (AES)

-(NSData*) encrypt:(NSData*) key {
  return [self encrypt:key
           withInitial:nil];
}

-(NSData*) encrypt:(NSData*) key
       withInitial:(NSData*)iv {
  return [self encrypt:key
           withInitial:iv
            andPadding:kCCOptionPKCS7Padding];
}

-(NSData*) encrypt:(NSData*) key
       withPadding:(CCOptions)options {
  return [self encrypt:key
           withInitial:nil
            andPadding:options];
}

-(NSData*) encrypt:(NSData*) key
       withInitial:(NSData*)iv
        andPadding:(CCOptions)options {
  return cipher(key,self,iv,kCCEncrypt,options,nil);
}

-(NSData*) decrypt:(NSData*) key {
  return [self decrypt:key
           withInitial:nil];
}

-(NSData*) decrypt:(NSData*) key
       withInitial:(NSData*)iv {
  return [self decrypt:key
           withInitial:iv
            andPadding:kCCOptionPKCS7Padding];
}

- (NSData *)decrypt:(NSData *)key
        withPadding:(CCOptions)options {
  return [self decrypt:key
           withInitial:nil
            andPadding:options];
}

-(NSData*) decrypt:(NSData*) key
       withInitial:(NSData*)iv
        andPadding:(CCOptions)options {
  return cipher(key,self,nil,kCCDecrypt,options,nil);
}

@end
