public class E485 {
    public int findMaxConsecutiveOnes (int[] nums) {
        int mainMAX = 0;
        int currMAX = 0;
        for (int i=0; i<nums.length; i++) {
            if (nums[i]==1) {
                currMAX += 1;
                mainMAX = Math.max(mainMAX,currMAX);
            } else {
                currMAX = 0;
            }
        }
        return mainMAX;
    }
    public static void main(String[] args) {
        System.out.println("No Test Implemented");
        System.out.println("No Task Performed");
    }
}