import java.util.ArrayList;

public class E118 {
    public static List<List<Integer>> generate (int numRows)
    {
        List<List<Integer>> output = new ArrayList<>();
        List<Integer> cur = new ArrayList<>();

        for (int i=0; i<numRows; i++) 
        {
            cur.add(0,1); // index, object
            for (int j=1; j<cur.size()-1; j++)
            {
                cur.set(j,(cur.get(j)+cur.get(j+1)));
            }
            output.add(new ArrayList<>(cur));
        }
        return output;
    }
    public static void main(String[] args) {
        System.out.println(" - - E118 Test - - \n");

        System.out.println("\n - - - - - - - - - \n\n");
    }
}