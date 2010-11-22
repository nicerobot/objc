//
//  cipher.h
//  NSData+AES
//
//  Created by Robert Nix on 2010.22.11.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CommonCrypto/CommonCryptor.h>

NSData *cipher(NSData *key,
               NSData *value,
               NSData *iv,
               CCOperation operation,
               CCOptions options);