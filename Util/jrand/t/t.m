#import <Foundation/Foundation.h>
#import "JRandom.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  int seed = 0;
  switch (argc) {
    case 1:
      seed = 0;
      break;
    default:
      seed = atoi(argv[1]);
      break;
  }
  JRandom *r = [[JRandom alloc] initWithSeed:seed];
  for (int i=0; i<10; i++) {
    printf("%08X\n",[r nextInt]);
  }
  [pool drain];
  return 0;
}
