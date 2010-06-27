#import <Foundation/Foundation.h>
#import "NSData+stringAsBase/NSData+stringAsBase.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  NSString *s;
  s = @"anna";
  for (int i=2; i<=94; i++) {
    NSLog(@"Base%d : %@ : %@", i, s, [[s dataUsingEncoding:NSUTF8StringEncoding] stringAsBase:i]);
  }
  s = @"Robert Clifton Nix";
  for (int i=2; i<=94; i++) {
    NSLog(@"Base%d : %@ : %@", i, s, [[s dataUsingEncoding:NSUTF8StringEncoding] stringAsBase:i]);
  }
  
  [pool drain];
  return 0;
}
