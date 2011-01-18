//
//  TestOptions.h
//  t
//
//  Created by Robert Nix on 2010.11.12.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>


/*
 There are four data types for options:
 1. Boolean. BOOL
    They don't accept parameters.
    The existence indicates true.
    Long versions can indicate false with no[option-name].
 2. Integer. int
 3. String. NSString*
 4. Array. NSMutableArray[NSString*]*
 
 There are three main "types" of options:
 1. Standard/global.
    Each instance of the parameter replaces any prior value.
    There is only one value at the end of processing all options.
 2. Array/global
    Each instance adds to a list of values.
    At the end of processing options, there is an array of values.
    Denoted by trailing $ in property name.
 3. Positional.
    Each instance of the parameter is distinct and positional.
    Denoted by trailing _ in property name.
 */

@interface TestOptions : NSObject

@property BOOL positional$;
// Options that have long equivalents should use the long's g/setter.
@property (getter=getPositional$,setter=setPositional$) BOOL p$;

@property BOOL version;
@property BOOL verbose;
// Uppercase and lowercase of the same letter require g/setter specified.
@property (getter=getVersion,setter=setVersion) BOOL v;
@property (getter=getVerbose,setter=setVerbose) BOOL V;

@property BOOL help;
@property BOOL moreHelp;
@property (getter=getMoreHelp,setter=setMoreHelp) BOOL H;
@property (getter=getHelp,setter=setHelp) BOOL h;

// To manipulate an option's value during processing, don't provide
// a g/setter of its equivalent long option. Instead, implement
// the accessors explicitly to call the long option's accessor.
@property int alwaysFive;
@property int f;

@property (copy) NSString* astring;
@property int anint;

// If an option can contain multiple values, its datatype is the name of
// the option and the readonly parameter is its array store.
@property (copy) NSMutableArray* multiple;
@property (copy,getter=getMultiple,setter=setMultiple) NSMutableArray* m;

@end
