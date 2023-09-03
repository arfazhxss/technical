import java.util.*;

public class Solution {
    public static List<List<Integer>> threeSum(int[] nums) {
        List<List<Integer>> finalList = new LinkedList<List<Integer>>();
        Arrays.sort(nums);    // Sorting the array because we need to because 1>> SKIP if we find a similar pivot 2>> Left and Right Pointer functionality

        for (int i=0; i<nums.length-2; i++) {
            if ((i>0)&&(nums[i]==nums[i-1])) {continue;}    // SKIPPING if the two pivots back to back are the same
            int leftPointer = i+1; // i = pivot, left pointer starting from the next of pivot
            int rightPointer = nums.length-1;   // right pointer starting from the rightmost side of the array
            int neededTotal = 0 - nums[i]; // we want the total sum to be 0, so we want the final to be 0, negative the pivot
            while (leftPointer<rightPointer) { // looping until they aren't the same numbers
                int currTotal = nums[leftPointer] + nums[rightPointer]; // making a number that adds upto the total of left and right, that number plus pivot should be 0
                if (currTotal<neededTotal) {++leftPointer;} // checking if that number comes down to the needed number without the pivot: if more, increase the left pointer!
                else if (currTotal>neededTotal) {--rightPointer;}   // checking if that number comes down to the needed number without the pivot: if less, decrease the right pointer!
                else { // this is in case they both add upto the expected sum
                    finalList.add(List.of(nums[i],nums[leftPointer],nums[rightPointer])); // we add that combination to the final List of all 
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