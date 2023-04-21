public class E125 {
    public static boolean isPalindromeOne (String s) 
    {
        String newString = "";
        for (Char c : s.toCharArray())
        {
            if (Character.isLetter(c)||Character.isDigit(c)) {newString+=c;}
        }
        /*
         * Now we hae newString without any extra spaces and anything other than letters and digits
         */
        int start = 0;
        int end = newString.length()-1;
        while (start>end) 
        {
            if (newString.charAt(start)!=newString.charAt(end)) {return false;}
            start++;
            end--;
        }
        return true;

    }
    public static void main(String[] args) {
        System.out.println(" - - E125 Test1 - - ");
        String testStringOne = "A man, a plan, a canal: Panama";
        System.out.println("testing String \""+testStringOne+"\":"+isPalindromeOne(testStringOne));
        System.out.println(" - - - - - - - - - ");
    }
}