class Solution2 {
     private int[] sortArr (int[] nums) {
         int t;
         for (int i=0; i<nums.length; i++) {
             for (int j=0; j<nums.length; j++) {
                 if (j==nums.length) break;
                 if ((i!=j)&&(nums[i]<=nums[j])) {
                       t=nums[i];
                     nums[i]=nums[j];
                     nums[j]=t;
                 }
             }
         } return nums;
    }
    public boolean containsDuplicate(int[] nums) {
        Arrays.sort(nums);
        // nums = sortArr (nums);
        for (int i=0; i<nums.length-1; i++) {
            if (nums[i]==nums[i+1]) return true;
        }
        return false;
    }
}
