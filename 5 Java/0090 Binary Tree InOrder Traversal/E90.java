import java.util.*;

public class E90 {
    public static List<Integer> Inorder(TreeNode root) {
        List<Integer> output = new ArrayList<>();
        helper(root, output);
        return output;
    }

    public static void helper(TreeNode root, List<Integer> output) {
        if (root == null) return;
        helper (root.right, output);
        output.add(root.val);
        helper(root.left,output);
    }

    public static void main(String[] args) {

    }
}