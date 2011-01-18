//
//  Options.m
//  CommandLine
//
//  Created by Robert Nix on 2010.11.12.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import "Option.h"

@implementation Option

@synthesize type, name, value;

-(id) init:(int)i type:(char)t withName:(NSString*)n withValue:(NSString*)v {
  if (!(self = [super initWithPosition:i ])) {
    return nil;
  }
  type = t;
  name = n;
  value = v;
  return self;
}

+(Option*) option:(int)i type:(char)t withName:(NSString*)n withValue:(NSString*)v {
  return [[[Option alloc] init:i type:t withName:n withValue:v] autorelease];
}

-(NSString*)description {
  int nl = [name length];
  NSMutableString* r = [NSMutableString stringWithCapacity:nl+2];
  [r appendString:@"-"];
  if (1 < nl)  {
    [r appendFormat:@"-"];
  }
  [r appendFormat:@"%@",name];
  if (value && 'c' != type) {
    [r appendFormat:@"=%@",value];
  }
  return r;
}
@end
