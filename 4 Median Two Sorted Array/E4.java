import java.util.Arrays;

class E4 {
    public static double findMedianSortedArrays (int[] nums1, int[] nums2) {
        int size = ((nums1.length)+(nums2.length));
        int[] nums3 = new int[size];
        nums3 = arrC(nums1, nums2, nums3, 0, 0, 0);
        System.out.println("A:"+Arrays.toString(nums1));
        System.out.println("B:"+Arrays.toString(nums2));
        System.out.println("C:"+Arrays.toString(nums3));
        if ((size%2)!=0) {
            int index = ((size-1)/2);
            System.out.println("1");
            return (double)nums3[index];
        } else {
            int index1 = (size/2);
            int index2 = ((size-2)/2);
            System.out.println(size);
            return (((double)nums3[index1] + (double)nums3[index2])/2);
        }
    }

    public static int[] arrC (int[] A, int[] B, int[] C, int i, int j, int k) {
        if ((i<A.length)&&(j<B.length)) {
            if (A[i]<B[j]) {
                C[k]=A[i];
                System.out.println("11Rec:\tA[i]:"+A[i]+";\tB[j]"+B[j]+";\tC[k]:"+C[k]+"\t\t\ti, j, k:\t"+i+" "+j+" "+k);
                return arrC(A, B, C, ++i, j, ++k);
            } else if (A[i]>B[j]) {
                C[k]=B[j];
                System.out.println("12Rec:\tA[i]:"+A[i]+";\tB[j]"+B[j]+";\tC[k]:"+C[k]+"\t\t\ti, j, k:\t"+i+" "+j+" "+k);
                return arrC(A, B, C, i, ++j, ++k);
            } else {
                C[k]=A[i];
                C[++k]=B[j];
                System.out.println("13Rec:\tA[i]:"+A[i]+";\tB[j]"+B[j]+";\tC[k]:"+C[k]+"\t\t\ti, j, k:\t"+i+" "+j+" "+k);
                return arrC(A, B, C, ++i, ++j, ++k);
            }
        } else if (i<A.length) {
            C[k]=A[i];
            System.out.println("2:\t\tA[i]:"+A[i]+";\tB[j]"+C[k]+"\t\t\ti, j, k:\t"+i+" "+j+" "+k);
            return arrC(A, B, C, ++i, j, ++k);
        } else if (j<B.length) {
            C[k]=B[j];
            System.out.println("3:\t\tB[j]"+B[j]+";\tC[k]:"+C[k]+"\t\t\ti, j, k:\t"+i+" "+j+" "+k);
            return arrC(A, B, C, i, ++j, ++k);            
        } else return C;
    }
    public static void main(String[] args) {
        int[] A = {0,0,0,0,0};
        int[] B = {-1,0,0,0,0,0,1};
        System.out.println(findMedianSortedArrays(A,B));
    }
}