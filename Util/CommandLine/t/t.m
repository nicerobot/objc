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


#import <Foundation/Foundation.h>
#import "CommandLine/CommandLine.h"
#import "TestOptions.h"

@interface Test : NSObject
@property BOOL b;
@end
@implementation Test
@synthesize b;
@end


int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
 
  CommandLine *cl = [CommandLine commandLineUsingOptionsName:@"TestOptions"];
  //[cl parse:argc withArguments:argv];
  printf("%s\n",[[cl usage] UTF8String]);
  
  if (0) {
    TestOptions *t = [[[TestOptions alloc] init] autorelease];
    printf("1.%d\n",[[t valueForKey:@"f"] intValue]);
    t.H = 1;
    t.h = 2;
    t.v = 3;
    t.V = 4;
    t.p$ = 5;
    t.f = 6;
    printf("2.%d %d %d %d %d %d %d\n",t.H,t.h,t.v,t.V,t.p$,t.alwaysFive,t.f);
    printf("3.%d\n",[[t valueForKey:@"alwaysFive"] intValue]);
  }

  if (0) {
    Test *t = [[[Test alloc] init] autorelease];
    [t setValue:[NSNumber numberWithInt:1] forKey:@"b"];
    printf("%d\n",[[t valueForKey:@"b"] intValue]);
  }  
  
  [pool drain];
  return 0;
}
