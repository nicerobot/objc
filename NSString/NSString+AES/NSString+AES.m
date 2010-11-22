//
//  NSString+Bases.m
//  Bases
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import "NSData+AES/NSData+AES.h"
#import "NSString+AES.h"

@implementation NSString (AES)

-(NSData*) encrypt:(NSString*) key {
  return [self encrypt:key
           withInitial:nil];
}

-(NSData*) encrypt:(NSString*) key
       withPadding:(CCOptions)options {
  return [self encrypt:key
           withInitial:nil
            andPadding:options];
}

-(NSData*) encrypt:(NSString*) key
       withInitial:(NSData*)iv {
  return [self encrypt:key
           withInitial:nil
            andPadding:kCCOptionPKCS7Padding];
}

-(NSData*) encrypt:(NSString*) key
       withInitial:(NSData*)iv
        andPadding:(CCOptions)options {
  NSData *k = [key dataUsingEncoding:NSUTF8StringEncoding];
  NSData *v = [self dataUsingEncoding:NSUTF8StringEncoding];
  return [v encrypt:k
        withInitial:nil
         andPadding:options];
}

-(NSData*) decrypt:(NSString*) key {
  return [self decrypt:key
           withInitial:nil];
}

-(NSData*) decrypt:(NSString*) key
       withPadding:(CCOptions)options {
  return [self decrypt:key
           withInitial:nil
            andPadding:options];
}

-(NSData*) decrypt:(NSString*) key
       withInitial:(NSData*)iv {
  return [self decrypt:key
           withInitial:nil
            andPadding:kCCOptionPKCS7Padding];
}

-(NSData*) decrypt:(NSString*) key
       withInitial:(NSData*)iv
        andPadding:(CCOptions)options {
  NSData *k = [key dataUsingEncoding:NSUTF8StringEncoding];
  NSData *v = [self dataUsingEncoding:NSUTF8StringEncoding];
  return [v encrypt:k
        withInitial:nil
         andPadding:options];
}

@end

