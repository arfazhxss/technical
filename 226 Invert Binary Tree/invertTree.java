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
class Solution {
    public TreeNode invertTree(TreeNode root) {
        if (root==null) return null;
        invert(root);
        return root;
    }
    public void invert (TreeNode node) {
        if (node==null) return;
        TreeNode temp = node.right;
        node.right=node.left;
        node.left=temp;
        invert(node.right); 
        invert(node.left); 
    }
}