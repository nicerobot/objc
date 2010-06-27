#import <Foundation/Foundation.h>
#import "NSString+stringConvertedToBase/NSString+stringConvertedToBase.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  NSLog(@"%@", [@"anna" toBase:64]);
  [pool drain];
  return 0;
}
