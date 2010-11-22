//
//  cipher.m
//  SHA256+AES
//
//  Created by Robert Nix on 2010.22.11.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#include <CommonCrypto/CommonDigest.h>
#import "cipher.h"

NSData *cipher(NSData *key,
               NSData *value,
               NSData *iv,
               CCOperation operation,
               CCOptions options)
{
  // NSLog(@"\nk=%@\nv=%@\ni=%@",key,value,iv);
  // SHA256 the key unless it's already 256 bits.
  if (kCCKeySizeAES256 != [key length]) {
    NSMutableData *_key = [NSMutableData dataWithLength:kCCKeySizeAES256];
    unsigned char *result = [_key mutableBytes];
    if (result != CC_SHA256([key bytes], [key length], result)) {
      @throw [NSException exceptionWithName:@"SHA256Exception"
                                     reason:@"Unknown"
                                   userInfo:nil];
    }
    key = _key;
  }
  
  int len = [value length];
  int capacity = (int)(len / kCCBlockSizeAES128 + 1) * kCCBlockSizeAES128;
  NSMutableData *data = [NSMutableData dataWithLength:capacity];
  
  /*
   NSLog(@"\nlen = %d, capacity = %d\n%@[%d]\n%@[%d]",
   len, capacity,
   key,[key length],
   value, [value length]
   );
   //*/
  
  // SHA1 the IV if provided.
  if (iv && kCCBlockSizeAES128 != [iv length]) {
    NSMutableData *_iv = [NSMutableData dataWithLength:kCCBlockSizeAES128];
    unsigned char *result = [_iv mutableBytes];
    if (result != CC_SHA1([iv bytes], [iv length], result)) {
      @throw [NSException exceptionWithName:@"SHA1Exception"
                                     reason:@"Unknown"
                                   userInfo:nil];
    }
    iv = _iv;
  } else {
    iv = [NSMutableData dataWithLength:kCCBlockSizeAES128];
  }
  
  const void *_iv = [iv bytes];
  
  size_t dataOutMoved;
  CCCryptorStatus ccStatus = CCCrypt(operation,
                                     kCCAlgorithmAES128,
                                     options,
                                     (const char*) [key bytes],
                                     [key length],
                                     _iv,
                                     (const void *) [value bytes],
                                     [value length],
                                     (void *)[data mutableBytes],
                                     capacity,
                                     &dataOutMoved
                                     );
  
  if (dataOutMoved < [data length]) {
    [data setLength:dataOutMoved];
  }
  
  switch (ccStatus) {
    case kCCSuccess:
      return data;
      break;
      
    case kCCParamError:
      @throw [NSException exceptionWithName:@"IllegalParameterValueException"
                                     reason:@"Illegal parameter value."
                                   userInfo:nil];
      break;
    case kCCBufferTooSmall:
      @throw [NSException exceptionWithName:@"InsufficentBufferException"
                                     reason:@"Insufficent buffer provided for specified operation."
                                   userInfo:nil];
      break;
    case kCCMemoryFailure:
      @throw [NSException exceptionWithName:@"MemoryAllocationFailure."
                                     reason:@"Memory allocation failure."
                                   userInfo:nil];
      break;
    case kCCAlignmentError:
      @throw [NSException exceptionWithName:@"InputAlignmentException"
                                     reason:@"Input size was not aligned properly. "
                                   userInfo:nil];
      break;
    case kCCDecodeError:
      @throw [NSException exceptionWithName:@"DecryptionException."
                                     reason:@"Input data did not decode or decrypt properly."
                                   userInfo:nil];
      break;
    case kCCUnimplemented:
      @throw [NSException exceptionWithName:@"FunctionNotImplementedException"
                                     reason:@"Function not implemented for the current algorithm."
                                   userInfo:nil];
      break;
  }
  return nil;
}

