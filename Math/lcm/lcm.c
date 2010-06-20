/*
 *  lcm.c
 *  Admittance
 *
 *  Created by Robert C. Nix on 10/04/15.
 *  Copyright 2010 nicerobot.org. All rights reserved.
 *
 */

#import "gcd.h"
#import "lcm.h"

int lcm(int a, int b) {
  int c;
  if (b > a) {
    c=b; b=a; a=c;
  }
  return a*b/gcd(a,b); 
}
