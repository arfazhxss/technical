/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class 617 {
    public TreeNode mergeTrees(TreeNode T1, TreeNode T2) {
        if ((T1==null)&&(T2==null)) return null;
        if (T1==null) return T2;
        if (T2==null) return T1;
        TreeNode TN = new TreeNode (T1.val+T2.val);
        TN.left = mergeTrees (T1.left, T2.left);
        TN.right = mergeTrees (T1.right, T2.right);
        return TN;
    }
}
