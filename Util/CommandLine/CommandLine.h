//
//  CommandLine.h
//  CommandLine
//
//  Created by Robert Nix on 2010.11.12.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CommandLine : NSObject {

}
@property (readonly) NSString* program;
@property (readonly) NSArray* options;
@property (readonly) NSArray* parameters;

-(id)initUsingOptions:(Class)cl;
-(id)initUsingOptionsName:(NSString*)name;
-(void) parse:(int)argc withArguments:(const char*[])argv;

+(CommandLine*) commandLineUsingOptions:(Class)optionsClass_;
+(CommandLine*) commandLineUsingOptionsName:(NSString*)name;  
+(CommandLine*) commandLine:(int)argc
              withArguments:(const char*[])argv
                usingOptions:(Class)cl;
+(CommandLine*) commandLine:(int)argc
              withArguments:(const char*[])argv
                usingOptionsName:(NSString*)name;
+(CommandLine*) commandLine:(int)argc
              withArguments:(const char*[])argv;
+(CommandLine*) commandLine:(int)argc,...;

-(NSString*) description;
-(NSString*) usage;

@end
