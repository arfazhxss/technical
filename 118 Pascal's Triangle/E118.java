import java.util.*;

public class E118 {
    public static List<List<Integer>> generate(int numRows) {
        List<List<Integer>> outerList = new ArrayList<>();
        List<Integer> innerList = new ArrayList<>();

        for (int i = 0; i < numRows; i++) {
            innerList.add(0, 1); // index, object
            System.out.println("innerList.get(0)=" + innerList.get(0) + "\n");
            for (int j = 1; j < innerList.size() - 1; j++) {
                System.out.println("InnerList " + i + " size:" + innerList.size());
                // System.out.println("For
                // j="+j+"\n\tinnerList.get(j)="+(innerList.get(j))+"\n\t\tinnerList.get(j+1)="+innerList.get(j+1));
                innerList.set(j, (innerList.get(j) + innerList.get(j + 1))); // index, object
            }
            outerList.add(new ArrayList<>(innerList));
        }
        return outerList;
    }

    public static void main(String[] args) {
        System.out.println(" - - E118 Test - - \n");
        int rows = 4;
        System.out.println("For size " + rows + " we have:\n" + generate(rows));
        System.out.println("\n - - - - - - - - - \n\n");
    }
}