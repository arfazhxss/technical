import java.util.ArrayList;

public class E118 {
    public static List<List<Integer>> generate (int numRows)
    {
        List<List<Integer>> outerList = new ArrayList<>();
        List<Integer> innerList = new ArrayList<>();

        for (int i=0; i<numRows; i++) 
        {
            innerList.add(0,1); // index, object
            for (int j=1; j<innerList.size()-1; j++)
            {
                innerList.set(j,(innerList.get(j)+innerList.get(j+1))); // index, object
            }
            outerList.add(new ArrayList<>(innerList));
        }
        return outerList;
    }
    public static void main(String[] args) {
        System.out.println(" - - E118 Test - - \n");

        System.out.println("\n - - - - - - - - - \n\n");
    }
}