public class E125 {
    public static boolean isPalindromeOne (String s) 
    {
        String newString = "";
        for (char c : s.toCharArray())
        {
            if (Character.isLetter(c)||Character.isDigit(c)) {newString+=c;}
        }
        /*
         * Now we hae newString without any extra spaces and anything other than letters and digits
         */
        newString=newString.toLowerCase();
        /*
         * And now all of them are smaller letters so that we can write tit without discriminatory capital letters
         */
        int start = 0;
        int end = newString.length()-1;
        while (start<end) 
        {
            if (newString.charAt(start)!=newString.charAt(end)) {return false;}
            start++;
            end--;
        }
        return true;

    }

    public static boolean isPalindromeTwo (String s)
    {
        s=s.toLowerCase();
        int start = 0;
        int end = s.length()-1;
        while (start<end)
        {
            while ((start<end)&&(!Character.isDigit(s.charAt(start)))&&(!Character.isLetter(s.charAt(start)))) {start++;}
            while ((start < end) && (!Character.isDigit(s.charAt(end))) && (!Character.isLetter(s.charAt(end)))) {end--;}

            if (start>=end) break;
            if ((s.charAt(start))!=(s.charAt(end))) {return false;}
            start++;
            end--;
        }
        return true;
    }
    public static void main(String[] args) {
        System.out.println(" - - E125 Test1 - - \n");
        String testStringOne = "A man, a plan, a canal: Panama";
        String testStringTwo = "race a car";
        System.out.println("["+testStringOne+"]: "+isPalindromeOne(testStringOne));
        System.out.println("[" + testStringTwo + "]: " + isPalindromeOne(testStringTwo));
        System.out.println("\n - - - - - - - - - \n\n");

        System.out.println(" - - E125 Test2 - - \n");
        System.out.println("[" + testStringOne + "]: " + isPalindromeTwo(testStringOne));
        System.out.println("[" + testStringTwo + "]: " + isPalindromeTwo(testStringTwo));
        System.out.println("\n - - - - - - - - - ");
    }
}