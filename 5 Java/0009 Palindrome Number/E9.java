// SOLVED FROM 2022, Actual 1
class E9 {
    public static boolean isPalindrome(int x) {
        String str0 = Integer.toString(x);
        String[] str1 = str0.split("");
        String str00 = new String();
        for (int i=str1.length-1;i>=0;i--) {
            str00+=str1[i];
        }
        String[] str2 = str00.split("");
        // System.out.println("A: "+str0+"\tB: "+str00);
        for (int i=0;i<str1.length;i++) {
            for (int j=0;j<str2.length;j++) {
                if ((i==j)&&(str1[i].compareTo(str2[j])!=0)) {
                    System.out.println("i: "+i+"\tA: "+str1[i]+"\tj: "+j+"\tB: "+str2[j]);
                    return false;
                } 
            }
        }
        return true;
    }
    // public static void main(String[] args) {
    //     System.out.println(isPalindrome(121));
    // }
}