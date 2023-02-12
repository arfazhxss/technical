public class E13 {
    public static int romanToInt (String s) {
        int count = 0;
        String[] array = s.split("");
        int[] numerals = new int[array.length];
        for (int i=0; i<array.length; i++) {
            switch (array[i]) {
                case "I": {numerals[i]=1; break;}
                case "V": {numerals[i]=5; break;}
                case "X": {numerals[i]=10; break;}
                case "L": {numerals[i]=50; break;}
                case "C": {numerals[i]=100; break;}
                case "D": {numerals[i]=500; break;}
                case "M": {numerals[i]=1000; break;}
            }
        System.out.println("numerals["+i+"]"+"\t"+numerals[i]);
        }
        for (int i=0; i<numerals.length;i++) {
            if (((i+1)!=(numerals.length))&&(numerals[i+1]>numerals[i])) {
                count-=(2*numerals[i]);
            }
            count+=numerals[i];
        }
        return count;
    }

    public static void main (String[] args) {
        String arg = "LVIII";
        System.out.println("\""+arg+"\""+" prints out:\t"+romanToInt(arg));
    }
}