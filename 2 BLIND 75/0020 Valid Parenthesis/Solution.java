import java.util.Stack;

class Solution {
    public static boolean isValid(String s) {
        String[] newstr = s.split("");
        Stack stk = new Stack();
        // Stack stk2 = new Stack();
        // Stack stk3 = new Stack();
        try {
            for (int i=0; i<newstr.length; i++) {
                if ((newstr[i].equals(")") || newstr[i].equals("}") || newstr[i].equals("]")) && i==0) {
                    // System.out.println("1");
                    return false;
                } else if ((newstr[i].equals("(")) || (newstr[i].equals("{")) || (newstr[i].equals("["))) {
                    stk.push(newstr[i]);
                }
                else if ((newstr[i].equals(")")) && (!stk.isEmpty()) && (stk.peek().equals("("))) {stk.pop();}
                else if ((newstr[i].equals("}")) && (!stk.isEmpty()) && (stk.peek().equals("{"))) {stk.pop();}
                else if ((newstr[i].equals("]")) && (!stk.isEmpty()) && (stk.peek().equals("["))) {stk.pop();}
            }
        } catch (Exception e) {
                return false;
        }
            
        if ((stk.isEmpty())) return true;
        else return false;
    } 
    public static void main(String[] args) {
        System.out.println(isValid("([)]"));
    }
}