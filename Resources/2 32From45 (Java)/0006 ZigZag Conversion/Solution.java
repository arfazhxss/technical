public class Solution {
    public static String convert (String s, int numRows) {
        char[] actualString = s.toCharArray();
        int magnumOne = numRows;        // num1
        int magnumTwo = numRows - 2;    // num2
        int magnum = magnumOne+magnumTwo;
        int size = actualString.length;
        int traversedCount = size;

        String newString = "";
                                                                // 6 ->     10;     8,2;    6,4;    4,6;    2,8;    10
        
        if (numRows>1) { 
            int i=0;
            while (i<size) {
                newString+=actualString[i];
                --traversedCount;
                i+=magnum;
            }

            int j;
            magnumOne=magnum;
            int magnumTemp=1;
            while ((traversedCount>=0)&&(magnumTemp<numRows-1)&&(magnumTemp<size)) {
                magnumOne-=2;
                System.out.println("1 {{M/O :"+magnumOne+"}}");
                newString+=actualString[magnumTemp];
                --traversedCount;

                i = magnumTemp;
                j = magnumTemp;
                while (i<size) {
                    if (i!=j) {       
                        newString+=actualString[i];
                        --traversedCount;
                        if (j<size) {
                            newString+=actualString[j];
                            --traversedCount;
                        }
                    }
                    // System.out.println("M/O: "+magnumOne);
                    if (i==j) {i+=(magnumOne);    j+=magnum;    
                        // System.out.println("111: i: "+i+"\tj: "+j);
                    }   
                    else {
                        // System.out.println("211: i: "+i+"\tj: "+j+"\tmagnumOne: "+magnumOne); 
                        i = j+magnumOne;   
                        j+=magnum;   
                        // System.out.println("222: i: "+i+"\tj: "+j);
                    }      
                }
                ++magnumTemp;
            }

            i=magnumTemp;
            while (i<size) {
                newString+=actualString[i];
                --traversedCount;
                i+=magnum;
            }
        } else return s;
        System.out.println("traversedRemaining:"+traversedCount);
        return newString;
    }
    public static void main (String[] args) {
        System.out.println("Converted String:\t{"+convert("A", 7)+"}");
    }
}
