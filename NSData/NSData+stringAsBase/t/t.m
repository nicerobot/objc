#import <Foundation/Foundation.h>
#import "NSData+stringAsBase/NSData+stringAsBase.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  ///*
  for (int i=2; i<=94; i++) {
    NSLog(@"Base%d : %@", i, [[NSData dataWithBytes:"EFG" length:3] stringAsBase:i]);
  }
  for (int i=2; i<=94; i++) {
    NSLog(@"Base%d : %@", i, [[NSData dataWithBytes:"\x1\x7f\xff" length:3] stringAsBase:i]);
  }
  NSString *s;
  s = @"AnnMarie";
  for (int i=2; i<=94; i++) {
    NSLog(@"Base%d : %@ : %@", i, s, [[s dataUsingEncoding:NSUTF8StringEncoding] stringAsBase:i]);
  }
  s = @"Nice Robot Corporation";
  for (int i=2; i<=94; i++) {
    NSLog(@"Base%d : %@ : %@", i, s, [[s dataUsingEncoding:NSUTF8StringEncoding] stringAsBase:i]);
  }
  //*/
  [pool drain];
  return 0;
}
