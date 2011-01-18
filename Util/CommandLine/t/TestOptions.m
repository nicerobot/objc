//
//  TestOptions.m
//  t
//
//  Created by Robert Nix on 2010.11.12.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import "TestOptions.h"

@implementation TestOptions

// Synthesize the long options first to generate their g/setters for use
// by the single character options.
@synthesize help,moreHelp,version,verbose,positional$,astring,anint,multiple;
@synthesize alwaysFive;
@synthesize f,h,H,m,p$,v,V;

-(void) setValue:(id)value forUndefinedKey:(id)key {
  printf("setUndfinedKey: ");
  if (key) printf("%s",[key UTF8String]);
  if (value) printf(" %s",[[value description] UTF8String]);
  printf("\n");
}

-(void)setAlwaysFive:(int)f_ {
  f = alwaysFive = 5;
  printf("setAlwaysFive: %d\n",f_);
}
-(int)getAlwaysFive {
  f = alwaysFive = 5;
  printf("getAlwaysFive: %d %d\n",alwaysFive,f);
  return 5;
}

-(void)setF:(int)f_ {
  f = self.alwaysFive;
}
-(int)getF {
  return self.alwaysFive;
}
@end
