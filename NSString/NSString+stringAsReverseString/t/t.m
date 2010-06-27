#import <Foundation/Foundation.h>
#import "NSString+stringAsReverseString/NSString+stringAsReverseString.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  // insert code here...
  NSLog(@"%@", [@"Hello, World!" stringAsReverseString]);
  [pool drain];
  return 0;
}
