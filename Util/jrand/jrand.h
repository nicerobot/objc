/*
 *  jrand.h
 *
 *  Created by Robert C. Nix on 10/04/15.
 *  Copyright 2010 nicerobot.org. All rights reserved.
 *
 */

#define multiplier 0x5DEECE66DL
#define addend 0xBL
#define mask ((1L << 48) - 1)

/**
 *
 */
int jrand();

/**
 *
 */
int jrandn(unsigned long long seed);

/**
 *
 */
int sjrandn(unsigned long long seed, unsigned long long bits);

/**
 *
 */
int sjrandp(unsigned long long *seeder, unsigned long long bits);

/**
 *
 */
int sjrandnp(unsigned long long *seeder, unsigned long long seed, unsigned long long bits);

/**
 *
 */
void sjrand(unsigned long long seed);

/**
 *
 */
void spjrand(unsigned long long *seeder, unsigned long long seed);
