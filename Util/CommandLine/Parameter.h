//
//  Parameters.h
//  CommandLine
//
//  Created by Robert Nix on 2010.11.12.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CommandLine/Argument.h"

@interface Parameter : Argument {

}
@property (readonly,copy) NSString* value;

-(id) init:(int)i withValue:(NSString*)v;
+(Parameter*) parameter:(int)i withValue:(NSString*)v;  

@end
