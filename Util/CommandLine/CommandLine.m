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


#import <objc/runtime.h>
#import "NSArray+charactersFromString.h"
#import "CommandLine.h"
#import "Option.h"
#import "Parameter.h"

@implementation CommandLine

@synthesize program, options, parameters;

Class optionsClass = nil;
NSMutableDictionary* allowed = nil;
id optionsInstance = nil;

-(id) initUsingOptions:(Class)optionsClass_ {

  if (!(self = [super init])) {
    return nil;
  }

  program = nil;
  options = nil;
  parameters = nil;

  if (!optionsClass_) {
    @throw [NSException exceptionWithName:@"NilArgumentException"
                                   reason:@"optionsClass_ must not be null"
                                 userInfo:nil];
  }

  optionsClass = optionsClass_;

  if (optionsClass) {
    // Obtain a list of all the user's command-line options.
    u_int count;
    objc_property_t* properties = class_copyPropertyList(optionsClass, &count);
    allowed = [NSMutableDictionary dictionaryWithCapacity:count];
    for (int i = 0; i < count ; i++)
    {
      NSString *name = [NSString stringWithUTF8String:property_getName(properties[i])];
      // Property names beginning with _ are considered internal.
      if ([name hasPrefix:@"_"]) {
        continue;
      }
      BOOL is_positional;
      if (is_positional = [name hasSuffix:@"$"]) {
        name = [name substringToIndex:[name length]-1];
      }
      NSString *attr = [NSString stringWithUTF8String:property_getAttributes(properties[i])];
      //printf("%s\n",[[attr description] UTF8String]);
      
      // Read-only properties are considered internal.
      if (NSNotFound != [attr rangeOfString:@",R,"].location) {
        continue;
      }
      unsigned char type = [attr characterAtIndex:1];
      if ('@' == type) {
        type = [attr hasPrefix:@"T@\"NSMutableArray"]?'A':'S';
      }

      // TODO for array-style options, check for array setter _[name]
      //      and wrapper getter to return the array.
      
      NSString *getter = nil;
      NSString *setter = nil;
      {
        for (NSString *at in [attr componentsSeparatedByString: @","]) {
          if ([at hasPrefix:@"G"]) {
            getter = [at substringFromIndex:1];
          } else if ([at hasPrefix:@"S"]) {
            setter = [at substringFromIndex:1];
          }
        }
        
        if (!getter) {
          getter = [NSString stringWithFormat:@"get%@",[name capitalizedString]];
        }
        if (!setter) {
          setter = [NSString stringWithFormat:@"set%@:",[name capitalizedString]];
        }
      }
      
      [allowed setObject:[NSArray arrayWithObjects:[NSString
                                                    stringWithFormat:@"%c",type],
                          getter,
                          setter,
                          is_positional?@"$":@"",
                          nil]
                  forKey:name];
    }
    free(properties);

  }
  return self;
}

-(id) initUsingOptionsName:(NSString*)name {
  if (!name) {
    @throw [NSException exceptionWithName:@"NilArgumentException"
                                   reason:@"name must not be null"
                                 userInfo:nil];
  }
  
  return [self initUsingOptions:NSClassFromString(name)];
}  

-(void) parse:(int)argc withArguments:(const char*[])argv {

  program = [NSString stringWithUTF8String:argv[0]];
  
  // Construct an instance of the user's options for passing values
  // through to be massaged if needed.
  optionsInstance = [[optionsClass alloc] init];
  
  NSMutableArray *options_ = [NSMutableArray arrayWithCapacity:2];
  NSMutableArray *parameters_ = [NSMutableArray arrayWithCapacity:2];
  
  // Parse the command-line.
  for( int argi=1; argi<argc; argi++ ) {
    NSString *arg = [NSString stringWithUTF8String:argv[argi]];
    NSArray *opt = nil;
    NSString *name = nil;
    NSArray *names = nil;
    id value = [NSNumber numberWithInt:1];
    
    BOOL is_long = NO;
    
    if ('-' == argv[argi][0]) { // option
      if (is_long = ('-' == argv[argi][1])) { // long
        NSArray *nv = [arg componentsSeparatedByString: @"="];
        name = [[nv objectAtIndex:0] substringFromIndex:2];
        names = [NSArray arrayWithObject:name];
        if (1 < [nv count]) {
          value = [nv objectAtIndex:1];
        } else {
          value = nil;
        }
      } else {
        name = [arg substringFromIndex:1];
        names = [NSArray arrayWithCharactersOfString:name];
      }
      
      // Iterate over the options. If this is a long option, there'll only
      // be one. If the argument is short, there can be multiple.
      for (NSString *n in names) {
        opt = [allowed objectForKey:n];
        if (!opt) {
          if (is_long /* is implied if n>1 char */ && [n hasPrefix:@"no"]) {
            n = [n substringFromIndex:2];
            opt = [allowed objectForKey:n];
            value = [NSNumber numberWithInt:0];
          } 
          if (!opt) {
            fprintf(stderr,"Invalid option: %s\n",[n UTF8String]);
            continue;
          }
        }

        //*
        unsigned char type = [[opt objectAtIndex:0] characterAtIndex:0];
        // If there option requires a parameter (is a string or int option),
        // grab the next argument.
        switch (type) {
          case 'A': // NSString*
          case 'S': // NSString*
          case 'i': // int
            if (!is_long && (1+argi)<argc) {
              value = [NSString stringWithUTF8String:argv[++argi]];
            }
            if (!value) {
              fprintf(stderr,"Option requires a parameter: %s\n",[n UTF8String]);
              continue;
            }
            break;
          case 'c': // Boolean
            if (!value) {
              value = [NSNumber numberWithInt:1];
            }
            break;
        }

        NSString *option_mode = [opt objectAtIndex:3];
        if ([option_mode length]) {
          n = [NSString stringWithFormat:@"%@%@",n,option_mode];
        }

        if (optionsInstance) {
          // Set the parameter.
          switch (type) {
            case 'A': // NSMutableArray*
              break;
            case 'S': // NSString*
              [optionsInstance setValue:value forKey:n];
              break;
            case 'i': // int
              [optionsInstance setValue:[NSNumber numberWithInt:[value intValue]] forKey:n];
              break;
            case 'c': // Boolean
              [optionsInstance setValue:value forKey:n];
              break;
          }
          value = [optionsInstance valueForKey:n];
          //*/
        }
        // TODO All non-positional parameters are global and assocaited with
        //      the intance of this CommandLine.
        [options_ addObject:[Option option:argi type:type withName:n withValue:value]];
      }
    } else { // parameter
      // TODO Parameter is to contain a set of positional options that are
      //      currently in effect for this parameter.
      [parameters_ addObject:[Parameter parameter:argi withValue:arg]];
    }
  }

  options = [NSArray arrayWithArray:options_];
  parameters = [NSArray arrayWithArray:parameters_];
}

+(CommandLine*) commandLineUsingOptions:(Class)optionsClass_ {
  return [[[CommandLine alloc] initUsingOptions:optionsClass_] autorelease];
}

+(CommandLine*) commandLineUsingOptionsName:(NSString*)name {
  return [CommandLine commandLineUsingOptions:NSClassFromString(name)];
}

+(CommandLine*) commandLine:(int)argc
              withArguments:(const char*[])argv
               usingOptions:(Class)optionsClass {

  CommandLine *cl = [[[CommandLine alloc] initUsingOptions:optionsClass] autorelease];
  [cl parse:argc withArguments:argv];
  return cl;
}

+(CommandLine*) commandLine:(int)argc
              withArguments:(const char*[])argv
                usingOptionsName:(NSString*)name {
  return [CommandLine commandLine:argc
                    withArguments:argv
                     usingOptions:NSClassFromString(name)];
}

+(CommandLine*) commandLine:(int)argc
              withArguments:(const char*[])argv {
  return [CommandLine commandLine:argc withArguments:argv usingOptions:nil];
}

+ (CommandLine*) commandLine:(int)argc,... {
  va_list args;
  va_start(args, argc);
  const char **argv = va_arg(args, const char **);
  va_end(args);
  return [CommandLine commandLine:argc withArguments:argv usingOptions:nil];
}

-(NSString*) description {
  return [NSString stringWithFormat:@"%@ %@ %@",program,options,parameters];
}

-(NSString*) usage {
  // TODO Organize in a dictionary of arrays per getter.
  //      Each getter will have one or more parameter names.
  //      Call the optionClass' [getter]Description if it exists.
  //      Print the dictionary in alphabetical order.
  return [allowed description];
}
@end
