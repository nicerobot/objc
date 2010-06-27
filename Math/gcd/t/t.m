#import <Foundation/Foundation.h>
#include "gcd.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  // insert code here...
  NSLog(@"7 == %d!", gcd(35,56));
  [pool drain];
  return 0;
}
