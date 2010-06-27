//
//  NSData+stringAsBase.h
//  Bases
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSData (stringAsBase) 

-(NSString*) stringAsBase:(int) base;

-(NSString*) stringAsBase2;
-(NSString*) stringAsBase8;
-(NSString*) stringAsBase16;
-(NSString*) stringAsBase32;
-(NSString*) stringAsBase64;
-(NSString*) stringAsBase94;

-(NSString*) stringAsBase:(int) base withPadding:(BOOL) pad;

-(NSString*) stringAsBase2withPadding:(BOOL) pad;
-(NSString*) stringAsBase8withPadding:(BOOL) pad;
-(NSString*) stringAsBase16withPadding:(BOOL) pad;
-(NSString*) stringAsBase32withPadding:(BOOL) pad;
-(NSString*) stringAsBase64withPadding:(BOOL) pad;
-(NSString*) stringAsBase94withPadding:(BOOL) pad;

@end
