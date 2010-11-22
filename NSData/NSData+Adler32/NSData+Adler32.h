//
//  NSData+Adler32.h
//  Adler32
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#import <Cocoa/Cocoa.h>

@interface NSData (Adler32)

-(uint32_t) adler32;

@end
