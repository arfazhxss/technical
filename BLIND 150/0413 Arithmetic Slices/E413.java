class E413 {
    public static int numberOfArithmeticSlices(int[] nums) {
        int size = nums.length;
        
        if (size>=3) {
            int diff = nums[1]-nums[0];
            // System.out.println(diff);
            boolean cond = checkArr(nums, 0, diff);
            System.out.println(fact(size)/(fact(3)*fact(size-3)));
            if ((size<=3)&&(cond==true)) {return fact(size)/(fact(size)*fact(size-3));}
        } return 0;
    }

    public static boolean checkArr (int[] arr, int i, int diff) {
        if ((i+1)<arr.length) {
            if ((arr[i]-arr[i+1])!=diff) {return false;}
            else return checkArr(arr, ++i, diff);
        } else {
            return checkArr(arr, i, diff);
        }
    }

    public static int fact (int n) {
        int i=1;
        int j=1;
        while (i<=n) {              // 1*1 * 1*2 * 1*3 * ... * 1*n
            j=(j)*(i++);
        } return j;
    }
    public static void main(String[] args) {
        // System.out.println(fact(5));
        int[] arrr = {1,2,3,4};
        System.out.println("testResult:\t"+numberOfArithmeticSlices(arrr));
    }
}