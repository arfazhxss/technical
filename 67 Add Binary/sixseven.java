class sixseven {
    private static String addBinary(String a, String b) {
        StringBuilder c = new StringBuilder();
        int carry=0;
        for (int i=0; i<a.length(); i++) {
            for (int j=0; j<b.length(); j++) {
                if ((a.charAt(i) == '1') && (b.charAt(j) == '1') && (carry == 0)) {
                    // c.setCharAt(i, '0');
                    carry = 1;
                } else if ((a.charAt(i) == '1') && (b.charAt(j) == '1') && (carry == 1)) {
                    // c.setCharAt(i, '1');
                    carry = 0;
                } else if ((carry == 0) && ((a.charAt(i) == 0) && (b.charAt(i) == 1)) || (a.charAt(i) == 1) && (b.charAt(i) == 0)) {
                    // c.setCharAt(i, '1');
                } else if ((carry == 1) && ((a.charAt(i) == 0) && (b.charAt(i) == 1)) || (a.charAt(i) == 1) && (b.charAt(i) == 0)) {
                    // c.setCharAt(i, '0');
                    carry = 1;
                } else if ((carry == 0) && (a.charAt(i) == 0) && (b.charAt(i) == 0)) {
                    // c.setCharAt(i, '0');
                } else if ((carry == 1) && (a.charAt(i) == 0) && (b.charAt(i) == 0)) {
                    // c.setCharAt(i, '1');
                    carry = 0;
                } else {
                    System.out.println("HERE!");
                }
            }
        }
        String cStr = c.toString();
        System.out.println(c);
        System.out.println(">>>["+cStr+"]");
        return cStr;
    }
    public static void main(String[] args) {
        System.out.println(addBinary("111","111"));
    }
}