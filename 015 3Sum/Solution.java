import java.util.*;

public class Solution {
    public static List<List<Integer>> threeSum(int[] nums) {
        List<List<Integer>> finalList = new LinkedList<List<Integer>>();
        Arrays.sort(nums);

        for (int i=0; i<nums.length-2; i++) {
            if ((i>0)&&(nums[i]==nums[i-1])) {continue;}
            int leftPointer = i+1;
            int rightPointer = nums.length-1;
            int neededTotal = 0 - nums[i];
            while (leftPointer<rightPointer) {
                int currTotal = nums[leftPointer] + nums[rightPointer];
                if (currTotal<neededTotal) {++leftPointer;}
                else if (currTotal>neededTotal) {--rightPointer;}
                else {
                    finalList.add(List.of(nums[i],nums[leftPointer],nums[rightPointer]));
                    ++leftPointer;
                    while ((leftPointer<rightPointer)&&(nums[leftPointer]==nums[leftPointer-1])) {++leftPointer;}}
            }
        }
        return finalList;
    }
    public static void main(String[] args) {
        int[] nums = {-1,0,1,2,-1,-4};
        // int[] nums = {-1,0,1};
        System.out.println(threeSum(nums));
    }
}