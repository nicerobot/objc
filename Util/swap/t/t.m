#import <Foundation/Foundation.h>
#import "swap.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  char x[] = "abc";
  swap(&x[0],&x[2]);
  NSLog(@"%s!",x);
  [pool drain];
  return 0;
}
