#import <Foundation/Foundation.h>
#import "NSString+AES/NSString+AES.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  NSString *s = @"anna";
  for (int i=2; i<=94; i++) {
    NSLog(@"Base%d : %@ : %@", i, s, [s stringAsBase:i]);
  }
  s = @"Robert Clifton Nix";
  for (int i=2; i<=94; i++) {
    NSLog(@"Base%d : %@ : %@", i, s, [s stringAsBase:i]);
  }
  
  [pool drain];
  return 0;
}
