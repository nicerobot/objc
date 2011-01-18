//
//  Parameters.m
//  CommandLine
//
//  Created by Robert Nix on 2010.11.12.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import "Parameter.h"

@implementation Parameter

@synthesize value;

-(id) init:(int)i withValue:(NSString*)v {
  if (!(self = [super initWithPosition:i ])) {
    return nil;
  }
  value = v;
  return self;
}

+(Parameter*) parameter:(int)i withValue:(NSString*)v {
  return [[[Parameter alloc] init:i withValue:v] autorelease];
}

-(NSString*) description {
  return value;
}

@end
