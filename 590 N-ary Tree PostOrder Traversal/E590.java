import java.util.*;

public class E590 {
    public static List<Integer> postorder (TreeNode root) {
        List<Integer> output = new ArrayList<>();
        helper(root,output);
        return output;
    }

    public static void helper (TreeNode root, List<Integer> output) {
        if (root==null) return;
        for (int i=0; i < root.children.size(); i++) {
            helper (root.children.get(i),output);
        }
        output.add(root.val);
    }
    public static void main(String[] args) {
        
    }
}