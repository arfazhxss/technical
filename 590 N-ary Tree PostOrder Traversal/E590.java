import java.util.ArrayList;

public class E590 {
    public static List<Integer> postorder (Node root) {
        List<Integer> output = new ArrayList<>();
        helper(root,output);
        return output;
    }

    public void helper (Node root, List<Integer> output) {
        if (root==null) return;
        for (int i=0; i < root.children.size(); i++) {
            helper (root.childre.get(i),output);
        }
        output.add(root.val);
    }
    public static void main(String[] args) {
        
    }
}