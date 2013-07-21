/* * Objective-C Augments - A small, miscellaneous set of Objective-C String and Data
 * augmentations
 * Copyright (C) 2011- nicerobot
 *
 * This file is part of Objective-C Augments.
 *
 * Objective-C Augments is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Objective-C Augments is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Objective-C Augments.  If not, see <http://www.gnu.org/licenses/>.
 */



#import <Cocoa/Cocoa.h>


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

@interface TestOptions : NSObject

@property BOOL positional$;
@property (getter=getPositional$,setter=setPositional$) BOOL p$;

@property BOOL version;
@property BOOL verbose;
@property (getter=getVersion,setter=setVersion) BOOL v;
@property (getter=getVerbose,setter=setVerbose) BOOL V;

@property BOOL help;
@property BOOL moreHelp;
@property (getter=getMoreHelp,setter=setMoreHelp) BOOL H;
@property (getter=getHelp,setter=setHelp) BOOL h;

@property int alwaysFive;
@property int f;

@property (copy) NSString* astring;
@property int anint;

@property (copy) NSMutableArray* multiple;
@property (copy,getter=getMultiple,setter=setMultiple) NSMutableArray* m;

@end
