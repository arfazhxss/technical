import java.util.*;

public class E589 {
    public static List<Integer> preorder(TreeNode root) {
        List<Integer> output = new ArrayList<>();
        helper(root, output);
        return output;
    }

    public static void helper(TreeNode root, List<Integer> output) {
        if (root == null) return;
        output.add(root.val);
        for (int i=0; i<root.children.size();i++) {
            helper(root.children.get(i),output);
        }
    }

    public static void main(String[] args) {

    }
}