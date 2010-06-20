//
//  NSString+Bases.h
//  Bases
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSString (Bases)

-(NSString*) toBase:(int) base;

-(NSString*) toBase2;
-(NSString*) toBase8;
-(NSString*) toBase16;
-(NSString*) toBase32;
-(NSString*) toBase64;
-(NSString*) toBase94;

-(NSString*) toBetterBase64;

-(NSString*) toBase:(int) base withPadding:(BOOL) pad;
-(NSString*) toBase2withPadding:(BOOL) pad;
-(NSString*) toBase8withPadding:(BOOL) pad;
-(NSString*) toBase16withPadding:(BOOL) pad;
-(NSString*) toBase32withPadding:(BOOL) pad;
-(NSString*) toBase64withPadding:(BOOL) pad;
-(NSString*) toBase94withPadding:(BOOL) pad;

@end
