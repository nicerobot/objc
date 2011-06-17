//
//  JRandom.h
//  jrand
//
//  Created by Robert Nix on 2011.25.03.
//  Copyright 2011 nicerobot.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRandom : NSObject {
@private
  unsigned long long randomSeed;
}
-(id)init;
-(id)initWithSeed:(unsigned long long)seed;
-(int)next:(int)bits;
-(int)nextInt;
-(void)setSeed:(unsigned long long)seed;

@end
