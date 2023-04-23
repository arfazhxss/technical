import java.util.*;

public class TreeNode {
    public int val;
    public TreeNode left;
    public TreeNode right;
    public ArrayList<TreeNode> children;

    public TreeNode(int val) {
        this.val = val;
        this.children = new ArrayList<TreeNode>();
    }

    public void addChild(TreeNode child) {
        this.children.add(child);
    }

    public void removeChild(TreeNode child) {
        this.children.remove(child);
    }

    public int numChildren() {
        return this.children.size();
    }

    public TreeNode getChild(int index) {
        return this.children.get(index);
    }

    public boolean hasChildren() {
        return !this.children.isEmpty();
    }

    public boolean isLeaf() {
        return this.children.isEmpty();
    }

    public int height() {
        if (this.isLeaf()) {
            return 0;
        } else {
            int height = -1;
            for (TreeNode child : this.children) {
                height = Math.max(height, child.height());
            }
            return height + 1;
        }
    }

    public int size() {
        int size = 1;
        for (TreeNode child : this.children) {
            size += child.size();
        }
        return size;
    }
}

