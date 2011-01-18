#import <Foundation/Foundation.h>
#import "NSURL+Bug8840060Fix/NSURL+Bug8840060Fix.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  ///*
  
  NSLog(@"%@",[NSURL URLWithString:@"http://developer.apple.com/library/mac/#documentation/Darwin/Conceptual/64bitPorting/MakingCode64-BitClean/MakingCode64-BitClean.html#//apple_ref/doc/uid/TP40001064-CH226-SW2"]);
  NSLog(@"%@",[NSURL URLWithString:@"http://developer.apple.com/library/mac/#documentation/Darwin/Conceptual/64bitPorting/MakingCode64-BitClean/MakingCode64-BitClean.html"]);
  
  // Or, a more simple example
  
  NSLog(@"%@",[NSURL URLWithString:@"http://developer.apple.com/#1#2"]);
  NSLog(@"%@",[NSURL URLWithString:@"http://developer.apple.com/#1"]);
  
  NSLog(@"%@",[[NSURL URLWithString:@"http://developer.apple.com/#1#2"] host]);
  NSLog(@"%@",[[NSURL URLWithString:@"http://developer.apple.com/#1"] host]);
  NSLog(@"%@",[[NSURL URLWithString:@"http://developer.apple.com/#1#2"] fragment]);
  NSLog(@"%@",[[NSURL URLWithString:@"http://developer.apple.com/#1"] fragment]);

  NSLog(@"---- Fixed ----");

  NSLog(@"%@",[NSURL URLWithRFCString:@"http://developer.apple.com/library/mac/#documentation/Darwin/Conceptual/64bitPorting/MakingCode64-BitClean/MakingCode64-BitClean.html#//apple_ref/doc/uid/TP40001064-CH226-SW2"]);
  NSLog(@"%@",[NSURL URLWithRFCString:@"http://developer.apple.com/library/mac/#documentation/Darwin/Conceptual/64bitPorting/MakingCode64-BitClean/MakingCode64-BitClean.html"]);
  
  // Or, a more simple example
  
  NSLog(@"%@",[NSURL URLWithRFCString:@"http://developer.apple.com/#1#2"]);
  NSLog(@"%@",[NSURL URLWithRFCString:@"http://developer.apple.com/#1"]);
  
  NSLog(@"%@",[[NSURL URLWithRFCString:@"http://developer.apple.com/#1#2"] host]);
  NSLog(@"%@",[[NSURL URLWithRFCString:@"http://developer.apple.com/#1"] host]);
  NSLog(@"%@",[[NSURL URLWithRFCString:@"http://developer.apple.com/#1#2"] fragment]);
  NSLog(@"%@",[[NSURL URLWithRFCString:@"http://developer.apple.com/#1"] fragment]);
  
  //*/
  [pool drain];
  return 0;
}
