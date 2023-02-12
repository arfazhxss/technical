class Solution {
    public int[] twoSum(int[] nums, int target) {
        int[] newArr = new int[2];
        for (int i=0;i<nums.length;i++) {
            for (int j=0; j<nums.length;j++) {
                if ((nums[i]+nums[j]==target)&&(i!=j)) {
                    newArr[0]=i;
                    newArr[1]=j;
                }
            }
        }
        return newArr;
    }
}
