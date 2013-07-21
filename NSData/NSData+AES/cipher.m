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



#include <CommonCrypto/CommonDigest.h>
#import "cipher.h"

NSData *sha1(NSData *bytes) {
  NSMutableData *_md = [NSMutableData dataWithLength:16];
  unsigned char *result = [_md mutableBytes];
  if (result != CC_SHA1([bytes bytes], [bytes length], result)) {
    @throw [NSException exceptionWithName:@"SHA1Exception"
                                   reason:@"Unknown"
                                 userInfo:nil];
  }
  return _md;
}

NSData *sha256(NSData *bytes) {
  NSMutableData *_md = [NSMutableData dataWithLength:32];
  unsigned char *result = [_md mutableBytes];
  if (result != CC_SHA256([bytes bytes], [bytes length], result)) {
    @throw [NSException exceptionWithName:@"SHA256Exception"
                                   reason:@"Unknown"
                                 userInfo:nil];
  }
  return _md;
}

NSData *cipher(NSData *key,
               NSData *value,
               NSData *iv,
               CCOperation operation,
               CCOptions options,
               NSMutableData *output) {

  // NSLog(@"\nk=%@\nv=%@\ni=%@",key,value,iv);
  // SHA256 the key unless it's already 256 bits.
  if (kCCKeySizeAES256 != [key length]) {
    key = sha256(key);
  }
  
  int len = [value length];
  int capacity = (int)(len / kCCBlockSizeAES128 + 1) * kCCBlockSizeAES128;
  NSMutableData *data;
  if (nil == output) {
    data = [NSMutableData dataWithLength:capacity];
  } else {
    data = output;
    if ([data length] < capacity) {
      [data setLength:capacity];
    }
  }
  
  /*
   NSLog(@"\nlen = %d, capacity = %d\n%@[%d]\n%@[%d]",
   len, capacity,
   key,[key length],
   value, [value length]
   );
   //*/
  
  // SHA1 the IV if provided.
  if (iv && kCCBlockSizeAES128 != [iv length]) {
    iv = sha1(iv);
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

