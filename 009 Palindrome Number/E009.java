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
        
        return true;
    }

    public static void main(String[] args) {

    }
}