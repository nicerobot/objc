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



#include <mach/mach_time.h>
#include <stdint.h>

#include "jrand.h"

static unsigned long long randomSeed = 0;

int jrand() {
  return jrandn(32);
}

int jrandn(unsigned long long bits) {
  return sjrandp(&randomSeed,bits);
}

int sjrandn(unsigned long long seed, unsigned long long bits) {
  return sjrandnp(&randomSeed,seed,bits);
}

int sjrandp(unsigned long long *seeder, unsigned long long bits) {
  if (!seeder) seeder = &randomSeed;
  return sjrandnp(seeder,*seeder,bits);
}

int sjrandnp(unsigned long long *seeder, unsigned long long seed, unsigned long long bits) {
  if (!seeder) seeder = &randomSeed;
  return (unsigned int)((*seeder = (seed * multiplier + addend) & mask) >> (48 - bits));
}


void sjrand(unsigned long long seed)
{
  spjrand(&randomSeed,seed);
}

void spjrand(unsigned long long *seeder, unsigned long long seed)
{
  if (!seeder) seeder = &randomSeed;
  *seeder = (seed ^ multiplier) & mask;
}
