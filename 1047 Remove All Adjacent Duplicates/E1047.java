public class E1047 {
    public String removeDuplicates (String S) {
        char[] stack = new chr[S.length()];
        int i = 0;

        for (int j=0; j<S.length(); j++) {
            char current_char = S.charAt(j);

            if ((i>0) && stack[i-1]==current_char) { i--; }
            else {
                stack[i] = current_char;
                i++;
            }
        }
        return new String(stack, 0, i);
    }
}