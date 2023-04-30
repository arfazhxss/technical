import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Arrays;

public class testClass {
    public static int removeDuplicates(int[] nums) {
        List<Integer> listCurr = new LinkedList<Integer>();

        listCurr.add((Integer)nums[0]);
        for (int i=1; i<nums.length; i++) {
            if (nums[i-1]<nums[i]) listCurr.add((Integer)nums[i]);
        }
        Object[] newArrInt = listCurr.toArray();
        for (int i=0; i<newArrInt.length; i++) {
            nums[i]=(int)newArrInt[i];
        }

        return listCurr.size();
    }
    public static void main (String[] args) {
        System.out.println("testClass\n");
        int[] arr = {0,1,2,2,4,4,5,6};
        System.out.println("Old Array: "+Arrays.toString(arr)+"\nsize being "+removeDuplicates(arr)+" and the Array: "+Arrays.toString(arr));
    }
}
