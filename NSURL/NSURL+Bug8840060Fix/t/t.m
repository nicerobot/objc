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
#import "NSURL+Bug8840060Fix/NSURL+Bug8840060Fix.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  ///*
  
  NSLog(@"%@",[NSURL URLWithString:@"http://developer.apple.com/library/mac/#documentation/Darwin/Conceptual/64bitPorting/MakingCode64-BitClean/MakingCode64-BitClean.html#//apple_ref/doc/uid/TP40001064-CH226-SW2"]);
  NSLog(@"%@",[NSURL URLWithString:@"http://developer.apple.com/library/mac/#documentation/Darwin/Conceptual/64bitPorting/MakingCode64-BitClean/MakingCode64-BitClean.html"]);
  
  // Or, a more simple example
  
  NSLog(@"%@",[NSURL URLWithString:@"http://developer.apple.com/#1#2"]);
  NSLog(@"%@",[NSURL URLWithString:@"http://developer.apple.com/#1"]);
  
  NSLog(@"%@",[[NSURL URLWithString:@"http://developer.apple.com/#1#2"] host]);
  NSLog(@"%@",[[NSURL URLWithString:@"http://developer.apple.com/#1"] host]);
  NSLog(@"%@",[[NSURL URLWithString:@"http://developer.apple.com/#1#2"] fragment]);
  NSLog(@"%@",[[NSURL URLWithString:@"http://developer.apple.com/#1"] fragment]);

  NSLog(@"---- Fixed ----");

  NSLog(@"%@",[NSURL URLWithRFCString:@"http://developer.apple.com/library/mac/#documentation/Darwin/Conceptual/64bitPorting/MakingCode64-BitClean/MakingCode64-BitClean.html#//apple_ref/doc/uid/TP40001064-CH226-SW2"]);
  NSLog(@"%@",[NSURL URLWithRFCString:@"http://developer.apple.com/library/mac/#documentation/Darwin/Conceptual/64bitPorting/MakingCode64-BitClean/MakingCode64-BitClean.html"]);
  
  // Or, a more simple example
  
  NSLog(@"%@",[NSURL URLWithRFCString:@"http://developer.apple.com/#1#2"]);
  NSLog(@"%@",[NSURL URLWithRFCString:@"http://developer.apple.com/#1"]);
  
  NSLog(@"%@",[[NSURL URLWithRFCString:@"http://developer.apple.com/#1#2"] host]);
  NSLog(@"%@",[[NSURL URLWithRFCString:@"http://developer.apple.com/#1"] host]);
  NSLog(@"%@",[[NSURL URLWithRFCString:@"http://developer.apple.com/#1#2"] fragment]);
  NSLog(@"%@",[[NSURL URLWithRFCString:@"http://developer.apple.com/#1"] fragment]);
  
  //*/
  [pool drain];
  return 0;
}
