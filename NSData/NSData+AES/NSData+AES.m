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


#include <CommonCrypto/CommonDigest.h>
#import "NSData+AES.h"
#import "cipher.h"

@implementation NSData (AES)

-(NSData*) encrypt:(NSData*) key {
  return [self encrypt:key
           withInitial:nil];
}

-(NSData*) encryptWithString:(NSString*) key {
  return [self encrypt:[key dataUsingEncoding:NSUTF8StringEncoding]
           withInitial:nil];
}

-(NSData*) encrypt:(NSData*) key
       withInitial:(NSData*)iv {
  return [self encrypt:key
           withInitial:iv
            andPadding:kCCOptionPKCS7Padding];
}

-(NSData*) encrypt:(NSData*) key
       withPadding:(CCOptions)options {
  return [self encrypt:key
           withInitial:nil
            andPadding:options];
}

-(NSData*) encrypt:(NSData*) key
       withInitial:(NSData*)iv
        andPadding:(CCOptions)options {
  return cipher(key,self,iv,kCCEncrypt,options,nil);
}

-(NSData*) decrypt:(NSData*) key {
  return [self decrypt:key
           withInitial:nil];
}

-(NSData*) decryptWithString:(NSString*) key {
  return [self decrypt:[key dataUsingEncoding:NSUTF8StringEncoding]
           withInitial:nil];
}

-(NSData*) decrypt:(NSData*) key
       withInitial:(NSData*)iv {
  return [self decrypt:key
           withInitial:iv
            andPadding:kCCOptionPKCS7Padding];
}

- (NSData *)decrypt:(NSData *)key
        withPadding:(CCOptions)options {
  return [self decrypt:key
           withInitial:nil
            andPadding:options];
}

-(NSData*) decrypt:(NSData*) key
       withInitial:(NSData*)iv
        andPadding:(CCOptions)options {
  return cipher(key,self,nil,kCCDecrypt,options,nil);
}

@end
