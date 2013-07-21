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
#import "NSData+stringAsBase/NSData+stringAsBase.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  ///*
  for (int i=2; i<=94; i++) {
    NSLog(@"Base%d : %@", i, [[NSData dataWithBytes:"EFG" length:3] stringAsBase:i]);
  }
  for (int i=2; i<=94; i++) {
    NSLog(@"Base%d : %@", i, [[NSData dataWithBytes:"\x1\x7f\xff" length:3] stringAsBase:i]);
  }
  NSString *s;
  s = @"AnnMarie";
  for (int i=2; i<=94; i++) {
    NSLog(@"Base%d : %@ : %@", i, s, [[s dataUsingEncoding:NSUTF8StringEncoding] stringAsBase:i]);
  }
  s = @"Nice Robot Corporation";
  for (int i=2; i<=94; i++) {
    NSLog(@"Base%d : %@ : %@", i, s, [[s dataUsingEncoding:NSUTF8StringEncoding] stringAsBase:i]);
  }
  //*/
  [pool drain];
  return 0;
}
