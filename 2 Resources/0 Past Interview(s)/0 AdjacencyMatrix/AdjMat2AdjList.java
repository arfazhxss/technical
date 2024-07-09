import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class AdjMat2AdjList {
    public static List<List<Integer>> buildAdjacencyList(String[][] adjacencyMatrix) {
        int n = adjacencyMatrix.length;
        List<List<Integer>> adjacencyList = new ArrayList<>(n);
        for (int i = 0; i < n; i++) {
            List<Integer> neighbors = new ArrayList<>();
            neighbors.add(i); // 0, 1, 2, 3 ... in every adjacency lists
            for (int j = 0; j < n; j++) {
                if (adjacencyMatrix[i][j].equals("1")) {
                    neighbors.add(j); // now the elements
                }
            }
            adjacencyList.add(neighbors);
        }
        return adjacencyList;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        if (reader.ready()) {
            List<String[]> inputList = new ArrayList<>();
            String line;
            while ((line = reader.readLine()) != null && !line.isEmpty()) {
                inputList.add(line.split("\\s+"));
            }
            int n = inputList.size();
            String[][] adjacencyMatrix = inputList.toArray(new String[n][]);
            List<List<Integer>> adjacencyList = buildAdjacencyList(adjacencyMatrix);

            System.out.println("Input List:\n");
            for (String[] row : adjacencyMatrix) {
                for (String element : row) {
                    System.out.print(element + " ");
                }
                System.out.println();
            }

            System.out.println("\nAdjacent List:\n");
            for (List<Integer> neighbors : adjacencyList) {
                for (Integer neighbor : neighbors) {
                    System.out.print(neighbor + " ");
                }
                System.out.println();
            }
        } else {
            System.out.println("Nothing");
        }
    }
}
