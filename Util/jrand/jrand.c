/*
 *  jrand.c
 *
 *  Created by Robert C. Nix on 10/04/15.
 *  Copyright 2010 nicerobot.org. All rights reserved.
 *
 */

#include <mach/mach_time.h>
#include <stdint.h>

#include "jrand.h"

static unsigned long long randomSeed = 0;

/**
 *
 */
int jrand() {
  return jrandn(32);
}

/**
 *
 */
int jrandn(unsigned long long bits) {
  return sjrandp(&randomSeed,bits);
}

/**
 *
 */
int sjrandn(unsigned long long seed, unsigned long long bits) {
  return sjrandnp(&randomSeed,seed,bits);
}

/**
 *
 */
int sjrandp(unsigned long long *seeder, unsigned long long bits) {
  if (!seeder) seeder = &randomSeed;
  return sjrandnp(seeder,*seeder,bits);
}

/**
 *
 */
int sjrandnp(unsigned long long *seeder, unsigned long long seed, unsigned long long bits) {
  if (!seeder) seeder = &randomSeed;
  return (unsigned int)((*seeder = (seed * multiplier + addend) & mask) >> (48 - bits));
}


/**
 *
 */
void sjrand(unsigned long long seed)
{
  spjrand(&randomSeed,seed);
}

/**
 *
 */
void spjrand(unsigned long long *seeder, unsigned long long seed)
{
  if (!seeder) seeder = &randomSeed;
  *seeder = (seed ^ multiplier) & mask;
}
