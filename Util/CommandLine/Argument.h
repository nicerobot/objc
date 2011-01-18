//
//  Argument.h
//  CommandLine
//
//  Created by Robert Nix on 2010.13.12.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Argument : NSObject {

}

@property (readonly) int position;

-(id)initWithPosition:(int)position_;

@end
