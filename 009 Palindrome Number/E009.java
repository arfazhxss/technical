public class E009 {
    public static boolean isPalindromeWOconversion(int x) {
        if (x < 0) return false;
        String str = Integer.toString(x);
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i)!=str.charAt(str.length-1-i)) return false;
        }
        return true;
    }

    public static boolean isPalindromeWconversion(int x) {
        if ((x<0)||((x!=0)&&(x%10==0))) return false;
        int num = x;
        int y = 0;

        while (num!=0) {
            int rem = num%10;
            num=num/10;
            y=y*10+rem;
        } 
        return y==x;
    }

    public static void main(String[] args) {

    }
}