//
//  NSString+stringAsReverseString.m
//  Admittance
//
//  Created by Robert C. Nix on 10/04/15.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import "NSString+stringAsReverseString.h"

@implementation NSString (stringAsReverseString)

+ (NSString*) stringAsReverseString:(NSString*)str {
  return [str stringAsReverseString];
}

- (NSString*) stringAsReverseString {
  int x = [self length];
  NSMutableString *result = [NSMutableString stringWithCapacity:x];
  while (x) {
    [result appendFormat:@"%c",[self characterAtIndex:--x]];
  }
  return result;
}

@end
