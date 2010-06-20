//
//  NSString+dataWithContentsOfString.h
//  Admittance
//
//  Created by Robert C. Nix on 10/04/15.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSString (dataWithContentsOfString)

+ (NSData*) dataWithContentsOfString:(NSString*)str;
- (NSData*) dataWithContentsOfString;

@end
