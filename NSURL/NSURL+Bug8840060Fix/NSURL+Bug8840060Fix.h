//
//  NSURL+Bug8840060Fix.h
//
//  Created by Robert C. Nix on 10/04/10.
//  Copyright 2010 nicerobot.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSURL (Bug8840060Fix) 

-(NSURL*) initWithRFCString:(NSString*)url;
+(NSURL*) URLWithRFCString:(NSString*)url;

@end
