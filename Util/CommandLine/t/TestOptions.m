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



#import "TestOptions.h"

@implementation TestOptions

@synthesize help,moreHelp,version,verbose,positional$,astring,anint,multiple;
@synthesize alwaysFive;
@synthesize f,h,H,m,p$,v,V;

-(void) setValue:(id)value forUndefinedKey:(id)key {
  printf("setUndfinedKey: ");
  if (key) printf("%s",[key UTF8String]);
  if (value) printf(" %s",[[value description] UTF8String]);
  printf("\n");
}

-(void)setAlwaysFive:(int)f_ {
  f = alwaysFive = 5;
  printf("setAlwaysFive: %d\n",f_);
}
-(int)getAlwaysFive {
  f = alwaysFive = 5;
  printf("getAlwaysFive: %d %d\n",alwaysFive,f);
  return 5;
}

-(void)setF:(int)f_ {
  f = self.alwaysFive;
}
-(int)getF {
  return self.alwaysFive;
}
@end
