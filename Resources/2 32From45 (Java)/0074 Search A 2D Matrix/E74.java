public class E74 {
    public boolean searchMatrix(int[][] matrix, int target) {
        if (matrix.length==0) return false;

        int rows = matrix.length;
        int columns = matrix[0].length;
        int left=0;
        int right = (rows*columns)-1;

        while (left<=right) {
            int mid_index = left + ((right-left)/2);
            int mid_element = matrix[mid_index/columns][mid_index%columns];
            if (mid_element== target) { return true; }
            else if (target < mid_element) { right = mid_index-1; }
            else if (target > mid_element) { left = mid_index+1; }
        }
        return false;
    }
    public static void main(String[] args) {
        System.out.println("E1047: No Test Implemented");
        System.out.println("Task Accomplished");
    }
}