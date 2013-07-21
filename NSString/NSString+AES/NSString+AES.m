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



#import "NSData+AES/NSData+AES.h"
#import "NSString+AES.h"

@implementation NSString (AES)

-(NSData*) encrypt:(NSString*) key {
  return [self encrypt:key
           withInitial:nil];
}

-(NSData*) encrypt:(NSString*) key
       withPadding:(CCOptions)options {
  return [self encrypt:key
           withInitial:nil
            andPadding:options];
}

-(NSData*) encrypt:(NSString*) key
       withInitial:(NSData*)iv {
  return [self encrypt:key
           withInitial:nil
            andPadding:kCCOptionPKCS7Padding];
}

-(NSData*) encrypt:(NSString*) key
       withInitial:(NSData*)iv
        andPadding:(CCOptions)options {
  NSData *k = [key dataUsingEncoding:NSUTF8StringEncoding];
  NSData *v = [self dataUsingEncoding:NSUTF8StringEncoding];
  return [v encrypt:k
        withInitial:nil
         andPadding:options];
}

-(NSData*) decrypt:(NSString*) key {
  return [self decrypt:key
           withInitial:nil];
}

-(NSData*) decrypt:(NSString*) key
       withPadding:(CCOptions)options {
  return [self decrypt:key
           withInitial:nil
            andPadding:options];
}

-(NSData*) decrypt:(NSString*) key
       withInitial:(NSData*)iv {
  return [self decrypt:key
           withInitial:nil
            andPadding:kCCOptionPKCS7Padding];
}

-(NSData*) decrypt:(NSString*) key
       withInitial:(NSData*)iv
        andPadding:(CCOptions)options {
  NSData *k = [key dataUsingEncoding:NSUTF8StringEncoding];
  NSData *v = [self dataUsingEncoding:NSUTF8StringEncoding];
  return [v encrypt:k
        withInitial:nil
         andPadding:options];
}

@end

