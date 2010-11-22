//
//  NSString+Bases.h
//  Bases
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSString (AES)

-(NSData*) encrypt:(NSString*) key;
-(NSData*) encrypt:(NSString*) key
       withPadding:(CCOptions) options;
-(NSData*) encrypt:(NSString*) key
       withInitial:(NSData*) iv;
-(NSData*) encrypt:(NSString*) key
       withInitial:(NSData*) iv
        andPadding:(CCOptions) options;

-(NSData*) decrypt:(NSString*) key;
-(NSData*) decrypt:(NSString*) key
       withPadding:(CCOptions) options;
-(NSData*) decrypt:(NSString*) key
       withInitial:(NSData*) iv;
-(NSData*) decrypt:(NSString*) key
       withInitial:(NSData*) iv
        andPadding:(CCOptions) options;

@end
