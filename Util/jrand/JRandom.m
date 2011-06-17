//
//  JRandom.m
//
//  Created by Robert Nix on 2011.25.03.
//  Copyright 2011 nicerobot.org. All rights reserved.
//

#import "JRandom.h"
#import "jrand.h"

@implementation JRandom

- (id)init
{
  return [self initWithSeed:0];
}

- (id)initWithSeed:(unsigned long long) seed
{
  self = [super init];
  if (self) {
    [self setSeed:seed];
  }
  
  return self;
}



// randomSeed is a long long ivar 

-(void) setSeed:(unsigned long long) seed
{
  @synchronized(self)
  {
    randomSeed = (seed ^ multiplier) & mask;
  }
}

-(int) nextInt
{
  return [self next:32];
}

-(int) next:(int)bits 
{
  @synchronized(self)
  {
    return sjrandp(&randomSeed,bits);
  }  
}

- (void)dealloc
{
  [super dealloc];
}

@end
