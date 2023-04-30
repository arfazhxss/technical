public class E482 {
    public String licenseKeyFormatting (String S, int K) {
        S = S.toUpperCase();
        S = S.replaceAll("-","");
        
        StringBuilder Str = new StringBuilder(S);

        for (int i = S.length()-K; i>0; i-=K) {
            Str.insert(i,"-");
        }
        return Str.toString();
    }
    public static void main(String[] args) {
        System.out.println("No Test Implemented");
        System.out.println("No Task Performed");
    }
}