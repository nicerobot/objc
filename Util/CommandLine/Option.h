//
//  Options.h
//  CommandLine
//
//  Created by Robert Nix on 2010.11.12.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CommandLine/Argument.h"

@interface Option : Argument {

}
@property (readonly) char type;
@property (readonly,copy) NSString *name;
@property (readonly,copy) id value;

-(id) init:(int)i type:(char)t withName:(NSString*)n withValue:(NSString*)v;
+(Option*) option:(int)i type:(char)t withName:(NSString*)n withValue:(NSString*)v;

@end
