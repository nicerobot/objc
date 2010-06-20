/*
 *  swap.c
 *  Admittance
 *
 *  Created by Robert C. Nix on 10/04/15.
 *  Copyright 2010 nicerobot.org. All rights reserved.
 *
 */

#include "swap.h"

void swap(char *a, char *b) {
  char tmp = *a;
  *a = *b;
  *b = tmp;
}
