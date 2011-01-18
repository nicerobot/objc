//
//  Argument.m
//  CommandLine
//
//  Created by Robert Nix on 2010.13.12.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import "Argument.h"

@implementation Argument

@synthesize position;

-(id)initWithPosition:(int)position_ {
  if (!(self = [super init])) {
    return nil;
  }
  position = position_;
  return self;
}

-(NSString*) description {
  return @"";
}

@end
