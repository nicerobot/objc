/* * Objective-C Augments - A small, miscellaneous set of Objective-C String and Data
 * augmentations
 * Copyright (C) 2011- nicerobot
 *
 * This file is part of Objective-C Augments.
 *
 * Objective-C Augments is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Objective-C Augments is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Objective-C Augments.  If not, see <http://www.gnu.org/licenses/>.
 */



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
