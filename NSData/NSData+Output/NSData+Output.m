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


#import "NSData+Output.h"

@implementation NSData (Output)

-(NSString*) descriptionAsHex {
  NSMutableString *result = [NSMutableString stringWithCapacity:[self length]*2];
  int l = [self length];
  const unsigned char *b = [self bytes];
  for (int i=0; i<l; i++) {
    [result appendFormat:@"%02X",b[i]];
  }
  return result;
}

-(const char*) descriptionAsHexUTF8String {
  return [[self descriptionAsHex] UTF8String];
}

-(NSString*) descriptionAsCharacters:(BOOL)encodeNonPrintable {
  NSMutableString *result = [NSMutableString stringWithCapacity:[self length]*2];
  int l = [self length];
  const char *b = [self bytes];
  for (int i=0; i<l; i++) {
    if (encodeNonPrintable && ! isprint(b[i])) {
      [result appendFormat:@"\t%02x",(unsigned char)b[i]];
    } else {
      [result appendFormat:@"%c",b[i]];
    }
  }
  return result;
}

-(NSString*) descriptionAsCharacters {
  return [self descriptionAsCharacters:true];
}

-(void) writeToFilePointer:(FILE*) fp{
  int l = [self length];
  const unsigned char *b = [self bytes];
  for (int i=0; i<l; i++) {
    putc(b[i],fp);
  }
}

-(void) writeToStandardOut {
  [self writeToFilePointer:stdout];
}

@end
