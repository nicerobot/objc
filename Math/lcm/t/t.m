#import <Foundation/Foundation.h>
#import "lcm.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  // insert code here...
  NSLog(@"%d",lcm(35,45));
  [pool drain];
  return 0;
}
