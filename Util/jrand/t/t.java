/*
 * C/Objective-C Utilities - A small, miscellaneous set of C/Objective-C utilities
 * Copyright (C) 2011- nicerobot
 *
 * This file is part of C/Objective-C Utilities.
 *
 * C/Objective-C Utilities is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * C/Objective-C Utilities is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with C/Objective-C Utilities.  If not, see <http://www.gnu.org/licenses/>.
 */

import java.util.Random;

class t {
  public static void main(String... args) {
    int seed = 0;
    if (args.length > 0) {
      seed = Integer.parseInt(args[0]);
    }
    Random r = new Random(seed);
    for (int i=0; i<10; i++) {
      System.out.printf("%08X\n",r.nextInt());
    }    
  }
}
