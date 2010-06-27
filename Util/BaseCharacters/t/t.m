#import <Foundation/Foundation.h>
#import "BaseCharacters/BaseCharacters.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  for (int i=2; i<=BASES; i++) {
    NSLog(@"%d %@",i, [BaseCharacters get:i]);
  }

  [pool drain];
  return 0;
}
