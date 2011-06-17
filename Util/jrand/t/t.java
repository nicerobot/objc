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
