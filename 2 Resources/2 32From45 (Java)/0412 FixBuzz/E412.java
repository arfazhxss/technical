import java.util.*;
public class E412 {
    public static List<String> fizzBuzz(int n) {
        List<String> output = new ArrayList<String>();
        for (int i=1, fizz=0, buzz=0; i<=n; i++) {
            fizz++;
            buzz++;
            if (fizz==3 && buzz==5) {
                fizz=0;
                buzz=0;
                output.add("FizzBuzz");
            } else if (fizz==3) {
                fizz=0;
                output.add("Fizz");
            } else if (buzz==5) {
                buzz=0;
                output.add("Buzz");
            } else {
                output.add(Integer.toString(i));
            }
        }
        return output;
    }
    public static void main(String[] args) {
        System.out.println("E412: Test Implemented Below:\n\n"+fizzBuzz(6)+"\n\n");
        System.out.println("Task Accomplished");
    }
}