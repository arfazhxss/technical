class SolutionE {
    public int[] twoSum(int[] nums, int target) {
        int[] newArr = new int[2];
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        for (int i = 0; i < nums.length; i++) {
            if (map.containsKey(nums[i])) {
                newArr[0] = map.get(nums[i]);
                newArr[1] = i;
                return newArr;
            }
            map.put(target - nums[i], i);
        }
        return newArr;
    }
}