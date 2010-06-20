//
//  NSString+dataWithContentsOfString.m
//  Admittance
//
//  Created by Robert C. Nix on 10/04/15.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import "NSString+dataWithContentsOfString.h"
#import "NSData+dataWithContentsOfString/NSData+dataWithContentsOfString.h"

@implementation NSString (dataWithContentsOfString)

+ (NSData*) dataWithContentsOfString:(NSString*)str {
  if (!str) return nil;
  return [NSData dataWithContentsOfString:str];
}

- (NSData*) dataWithContentsOfString {
  return [NSString dataWithContentsOfString:self];
}

@end
