import java.util.Arrays;
public class firstAndLast {
    public static int[] bigArrRec (int[] arr, int targ, int beg, int end, int i, int constr) {
        int[] newArr = {-1,-1};

        if ((i<arr.length)&&(arr[i]!=targ)&&(beg==end)) {
            // System.out.println("000:\t"+i);
            return bigArrRec(arr,targ,beg,end,++i,constr);
        } else if ((i<arr.length)&&(arr[i]==targ)&&(beg==end)) {
            beg=i;
            // System.out.println("001:\ti:"+i+"\tbeginning: "+beg+" ending: "+end);
            return bigArrRec(arr,targ,beg,end,++i,constr);
        } else if ((i<arr.length)&&(arr[i]==targ)&&(beg!=end)) {
            end=i;
            // System.out.println("002:\ti:"+i+"\tbeginning: "+beg+" ending: "+end);
            return bigArrRec(arr,targ,beg,end,++i,constr);
        } else if ((beg!=end)) {
            // System.out.println("003:\t"+i);
            // System.out.println(arr.length);
            if (end==constr) {end=beg;}
            newArr[0]=beg; newArr[1]=end;
            return newArr;
        } return newArr;
    }

    public static int[] searchRange(int[] nums, int target) {
        int[] newArr = bigArrRec (nums, target, -999, -999, 0,-999);
        return newArr;
    }
    public static void main (String[] args) {
        int[] arrM = {3,3,3};      
        // int[] arrM = {1,2,4,4,4,4}; 
        System.out.println(Arrays.toString(searchRange(arrM,3)));
    }
}