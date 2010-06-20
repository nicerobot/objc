/*
 *  gcd.c
 *  Admittance
 *
 *  Created by Robert C. Nix on 10/04/15.
 *  Copyright 2010 nicerobot.org. All rights reserved.
 *
 */

#include "gcd.h"

int gcd(int a, int b) {
  int t;
  while(b != 0)
  {
    t = a % b;
    a = b;
    b = t;
  }
  return a;
}
