import java.util.Arrays;

class E14 {
    public static String longestCommonPrefix(String[] strs) {
        String str = "";
        if (strs.length<2) {
            return strs[0];
        } else if (strs.length >=2) {
            boolean cond=true;
            String str000 = strs[0];
            String str001 = strs[1];
            String[] str01 = str000.split("");
            String[] str02 = str001.split("");
            for (int i=0; i<str01.length; i++) {
                for (int j=0; j<str02.length; j++) {
                    if ((i==j)&&(str01[i].compareTo(str02[j])==0)&&(cond==true)) {
                        str+=str01[i];
                    } else if ((i==j)&&(str01[i].compareTo(str02[j])!=0)) {
                        cond=false;
                        break;
                    }
                }
            }
            // System.out.println(str);
            if (strs.length==2) {
                return str;
            }
        }
        String string = "";
        if (strs.length>2) {
            int k=0;
            boolean cond = true;
            for (int l=2; l<strs.length; l++) {
                String[] str000 = str.split("");
                String str1 = strs[l];
                String[] str01 = str1.split("");
                // System.out.println(Arrays.toString(str01));
                if(k>str000.length) break;
                for (int i=0; i<str01.length; i++) {
                    for (int j=0; j<str000.length; j++) {
                        ++k;
                        if ((i==j)&&(str01[i].compareTo(str000[j])==0)&&(cond==true)) {
                            System.out.print("i: ["+i+"] "+"j: ["+j+"]: \t"+str000[j]+"\n");
                            string+=str000[j];
                        } else if ((i==j)&&(str01[i].compareTo(str000[j])!=0)) {
                            cond=false;
                            break;
                        }
                        // System.out.println();
                    }
                }
                // System.out.println(Arrays.toString(str000));
    
            } 
        } return string;
    }
    public static void main(String[] args) {
        // String[] strs1 = {"cir","car"};
        // System.out.println("Returned: ["+longestCommonPrefix(strs1)+"]");        
        String[] strs2 = {"baab","bacb","b","cbc"};
        System.out.println("Returned: ["+longestCommonPrefix(strs2)+"]");
    }
}