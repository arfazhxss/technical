import java.util.*;

public class E118 {
    public static List<List<Integer>> generate(int numRows) {
        List<List<Integer>> outerList = new ArrayList<>();
        List<Integer> innerList = new ArrayList<>();

        for (int i = 0; i < numRows; i++) {
            // System.out.println("\ninside first loop [i:"+i+"]");
            innerList.add(0, 1); // index, object
            // System.out.println("innerList.get(0)=" + innerList.get(0) + "\n");
            for (int j = 1; j < innerList.size() - 1; j++) {
                // System.out.println("\tinside second loop");
                // System.out.println("\n\t\t[BEFORE]");
                // System.out.println("\t\tinnerset: "+innerList);
                // System.out.println("\t\tsize:" + innerList.size()+" [j="+j+"] [innerList.get(j)="+(innerList.get(j))+"] [innerList.get(j+1)="+innerList.get(j+1)+"]");
                innerList.set(j, (innerList.get(j) + innerList.get(j + 1))); // index, object
                // System.out.println("\n\t\t[AFTER]");
                // System.out.println("\t\tsize:" + innerList.size()+" [j="+j+"] [innerList.get(j)="+(innerList.get(j))+"] [innerList.get(j+1)="+innerList.get(j+1)+"]");
                // System.out.println("\t\tafter set: " + innerList);
            }
            // System.out.println("\n\t\t< CURRENT INNERLIST : "+innerList+" >");
            outerList.add(new ArrayList<>(innerList));
        }
        return outerList;
    }

    public static void main(String[] args) {
        System.out.println(" - - E118 Test - - \n");
        int rows = 5;
        // generate(rows);
        System.out.println("For size " + rows + " we have:\n\n" + generate(rows));
        System.out.println("\n - - - - - - - - - \n\n");
    }
}