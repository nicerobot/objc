//
//  NSData+Bases.m
//  Bases
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//
#import <CommonCrypto/CommonHMAC.h>
#import "BaseCharacters/BaseCharacters.h"
#import "lcm.h"
#import "NSData+dataConvertedToBase.h"
#import "NSString+stringAsReverseString/NSString+stringAsReverseString.h"

uint32_t divideBy(int base, uint32_t * number, int size) {
  uint32_t r = 0;
  uint32_t d;
  for (int i=0; i<size; ++i) {
    d = (number[i] + r*0x100000000) / base;
    r = (number[i] + r*0x100000000) % base;
    number[i] = d;
  }
  return r;
}

int zero(uint32_t* number, int size) {
  for (int i=0; i<size; ++i) {
    if (number[i] != 0) {
      return 0;
    }
  }
  return 1;
}

@implementation NSData (dataConvertedToBase)

-(NSString*) toBase:(int) base {
  return [self toBase:base withPadding:true];
}

/**
 * non power-of-2 base conversion. why doesn't it work for others?!
 */
-(NSString*) toOffBase:(int) base withPadding:(BOOL) pad {
  
  // baseN
  NSString *bases = [BaseCharacters get:base];
  if (!bases) return nil;
  
  int size = [self length];
  
  // NSString+Bases depends on this being an NSMutableString.
  NSMutableString *result = [NSMutableString stringWithCapacity:size*4];
  
  int widen = 4-size%4;
  size += widen;
  unsigned char buf[size];
  [self getBytes:buf+widen length:size];
  while(widen) {
    buf[--widen] = 0;
  }
  uint32_t *number = (uint32_t*) buf;
  size /= 4;
  
  do {
    uint32_t r = divideBy(base,number,size);
    unsigned char c = [bases characterAtIndex:r];
    [result appendFormat:@"%c",c];
  } while(!zero(number,size));
  
  return [result stringAsReverseString];
}

-(NSString*) toBase:(int) base withPadding:(BOOL) pad {

  // baseN
  NSString *bases = [BaseCharacters get:base];
  if (!bases) return nil;

  unsigned char length = [bases length] - 1;

  unsigned char bits = 0;
  unsigned int maximum = 1;
  for(int i=length; i!=0; i>>=1) {
    ++bits;
    maximum <<= 0x1;
  }

  unsigned char overflow = 0;
  // If the base isn't a power of 2, use the last character of the base as an overflow indicator.
  if (0 != (maximum ^ (length+1))) {
    overflow = [bases characterAtIndex:length--];
  }

  // Bytes required for padding.
  unsigned char bytes_required = lcm(bits,8)/8;
  // mask bits
  unsigned int mask_bits = maximum -1;
  
  // Length of the data being converted.
  unsigned int data_length = [self length];
  
  unsigned int total_bits = data_length * 8;
  unsigned char padding = total_bits % bits % bytes_required;
  
  unsigned char remainder = 0;
  unsigned int data_index = 0;

  unsigned char shifter_size = sizeof(unsigned short);
  unsigned int shifter_bits = shifter_size*8-8;
  unsigned short shifter = 0;
  unsigned int shifted = 0;
  
  unsigned char *data = (unsigned char*) [self bytes];
  // Seed the shifter.
  for (int i=0; i<shifter_size; i++) {
    shifter <<= 8;
    if (data_index<data_length) {
      shifter |= data[data_index++];
    }
  }
  
  // Clear the results.
  // The maximum length is one character per bit.
  unsigned int result_index = data_length*8+padding+1;
  // NSString+Bases depends on this being an NSMutableString.
  NSMutableString *result = [NSMutableString stringWithCapacity:result_index];
  
  /*
   printf("\nbase %d - mask:%02x - bits:%d - total:%d - max:%02x - pad:%d - size:%d - shift:%d - %04X\n",
   length, mask_bits, bits, total_bits, maximum, padding, shifter_size, shifter_bits, shifter); //*/
  
  do {
    //printf("%03d %02x\n",data_index,data[data_index]);
    // Mask-off the left-most 'bits' from shifter
    // and use it as the index into the base's digits array.
    unsigned char leftmost_bits = mask_bits & ( shifter >> (shifter_bits+8-bits) );
    @try {
      if (leftmost_bits > length) {
        [result appendFormat:@"%c%c",overflow,[bases characterAtIndex:(leftmost_bits - length)]];
        leftmost_bits >>= 0x1;
      }
      [result appendFormat:@"%c",[bases characterAtIndex:leftmost_bits]];
    }
    @catch (NSException *exception) {
      NSLog(@"main: Caught %@: %@\n\tleftmost: %d",
            [exception name], [exception reason],
            leftmost_bits);
      break;
    }
    
    // Remove the left-most 'bits'.
    // If there's a remainder and bits > remainder,
    // shift-left remainder, append next_byte, shift different
    if (0 != remainder && remainder < bits) {
      shifter <<= remainder;
      if (data_index < data_length) {
        shifter |= data[data_index++];
      }
      shifter <<= bits-remainder;
    } else {
      shifter <<= bits;
    }
    
    shifted += bits;
    remainder = 8-shifted%8;
    
    // If shifted to a byte boundary, pull the next byte.
    if (8 == remainder && data_index < data_length) {
      shifter |= data[data_index++];
    }
    
    // Do this while shifter has been shifted fewer than 8 bits.        
  } while (shifted < total_bits);
  
  while(pad && padding) {
    [result appendFormat:@"="];
    --padding;
  }

  return result;
}

-(NSString*) toBase2 { return [self toBase:2]; }
-(NSString*) toBase8 { return [self toBase:8]; }
-(NSString*) toBase16 { return [self toBase:16]; }
-(NSString*) toBase32 { return [self toBase:32]; }
-(NSString*) toBase64 { return [self toBase:64]; }
-(NSString*) toBase94 { return [self toBase:94]; }

-(NSString*) toBase2withPadding:(BOOL) pad { return [self toBase:2 withPadding:pad]; }
-(NSString*) toBase8withPadding:(BOOL) pad { return [self toBase:8 withPadding:pad]; }
-(NSString*) toBase16withPadding:(BOOL) pad { return [self toBase:16 withPadding:pad]; }
-(NSString*) toBase32withPadding:(BOOL) pad { return [self toBase:32 withPadding:pad]; }
-(NSString*) toBase64withPadding:(BOOL) pad { return [self toBase:64 withPadding:pad]; }
-(NSString*) toBase94withPadding:(BOOL) pad { return [self toBase:94 withPadding:pad]; }

@end
