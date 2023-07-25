/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */

import java.util.LinkedList;
import java.util.Arrays;
import java.util.List;

class Solution {
    public static int[] printAll (ListNode head) {
        List newList = new LinkedList();
        while (head.next!=null) {
            newList.add(head.val);
        }
        int[] arr = new int[newList.size()];
        int i=0;
        while (!newList.isEmpty()) {
            arr[i]=(Integer)newList.get(i++);
        }
        return arr;
    }
    public static void main(String[] args) {
        ListNode list1 = new ListNode();
        ListNode list2 = new ListNode();
        ListNode curr = new ListNode(1,null);
        list1=curr;
        ListNode temp = new ListNode(2,null);
        curr.next=temp;
        temp = new ListNode(3,null);
        curr.next=temp;
        System.out.println(Arrays.toString(printAll(list1)));
    }
}
