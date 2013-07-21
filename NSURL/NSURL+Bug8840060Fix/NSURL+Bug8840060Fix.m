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


#import <CommonCrypto/CommonHMAC.h>
#import "NSURL+Bug8840060Fix.h"

NSString* stripFragments(NSString* url) {
  NSArray *fragments = [url componentsSeparatedByString:@"#"];
  if (2 <= [fragments count]) {
    url = [NSString stringWithFormat:@"%@#%@",
           [fragments objectAtIndex:0],
           [fragments objectAtIndex:1]];
  }
  return url;
}

@implementation NSURL (Bug8840060Fix)

-(NSURL*) initWithRFCString:(NSString*)url {
  return [self initWithString:stripFragments(url)];
}

+(NSURL*) URLWithRFCString:(NSString*)url {
  return [NSURL URLWithString:stripFragments(url)];
}

@end
