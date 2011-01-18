//
//  NSURL+Bug8840060Fix.m
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#import <CommonCrypto/CommonHMAC.h>
#import "NSURL+Bug8840060Fix.h"

/**
 * Simplistic workaround for NSURL bug 8840060. This will simply strip
 * the the additional fragments from the string.
 */
NSString* stripFragments(NSString* url) {
  NSArray *fragments = [url componentsSeparatedByString:@"#"];
  if (2 <= [fragments count]) {
    url = [NSString stringWithFormat:@"%@#%@",
           [fragments objectAtIndex:0],
           [fragments objectAtIndex:1]];
  }
  return url;
}

@implementation NSURL (Bug8840060Fix)

-(NSURL*) initWithRFCString:(NSString*)url {
  return [self initWithString:stripFragments(url)];
}

+(NSURL*) URLWithRFCString:(NSString*)url {
  return [NSURL URLWithString:stripFragments(url)];
}

@end
