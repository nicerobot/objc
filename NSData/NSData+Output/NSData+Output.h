//
//  NSData+Output.h
//  Bases
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#import <Cocoa/Cocoa.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSData (Output)

-(NSString*) descriptionAsHex;
-(const char*) descriptionAsHexUTF8String;
-(NSString*) descriptionAsCharacters;

-(void) writeToFilePointer:(FILE*) fp;
-(void) writeToStandardOut;

@end
