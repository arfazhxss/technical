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
class Solution {
    
    public static ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode l3 = new ListNode();
        ListNode curL3 = l3;
        if ((l1!=null)&&(l2!=null)) {
            int number = l1.val + l2.val;
            if (number<10) {curL3.val = number; curL3.next = addRec(l1.next, l2.next, curL3, 0);}
            else {curL3.val = number%10; curL3.next = addRec(l1.next, l2.next, curL3, 1);}
        }
        return l3;
    }

    public static ListNode addRec (ListNode curL1, ListNode curL2, ListNode curL3, int number) {
        ListNode temL3 = new ListNode();
        // System.out.println("numTest:\t"+number);
        if ((curL1!=null)||(curL2!=null)) {
            int tempNumber=0;
            if (curL1==null) {
                number+=0;
            } else if (curL1.next!=null) {
                number+=curL1.val;                                              
                // curL1=curL1.next;
                // System.out.print("\nTest1.1:\t\\\\\tcurL1.val: "+curL1.val+"\tnumber: "+number);
            } else if (curL1.next==null) {
                number+=curL1.val;        
                // System.out.print("\nTest1.2:\t\\\\\tcurL1.val: "+curL1.val+"\tnumber: "+number);
            } 

            if (curL2==null) {
                number+=0;
            } else if (curL2.next==null) {
                number+=curL2.val;
                // System.out.print("\nTest2.2:\t\\\\\tcurL2.val: "+curL2.val+"\tnumber: "+number);
            } else if (curL2.next!=null) {
                number+=curL2.val;
                // System.out.print("\nTest2.1:\t\\\\\tcurL2.val: "+curL2.val+"\tnumber: "+number);
            } 

            if (number>=10) {
                tempNumber=number%10;
                number=1;
                // System.out.print("\tcarry: {"+number+"}");
            } else if (number<10) {
                tempNumber=number;
                number=0;
                // System.out.print("\tcarry: {"+number+"}");
            }
            // System.out.println("\ttNum:\t"+tempNumber+"\tnum:\t"+number);
            temL3.val=tempNumber;
            temL3.next=null;                                                    // success in creating unique nodes
            curL3=temL3;
            curL3.next=null;
            // System.out.println("\ntemp3val:\t"+temL3.val+"\tcur3val:\t"+curL3.val);
            // System.out.println("temp3next:\t"+temL3.next+"\tcur3next:\t"+curL3.next);
            if ((curL1==null)&&(curL2!=null)) {
                curL3.next = addRec(null, curL2.next, curL3, number);
            } else if ((curL2==null)&&(curL1!=null)) {
                curL3.next = addRec(curL1.next, null, curL3, number);
            } else if ((curL1.next!=null)||(curL2.next!=null)) {
                curL3.next = addRec(curL1.next, curL2.next, curL3, number);
            } else if ((curL1.next==null)||(curL2.next==null)) {
                curL3.next = addRec(null, null, curL3, number);
            }
            return temL3;
        } else if ((curL1==null)&&(curL2==null)&&(number==1)) {
            temL3.val=1;
            temL3.next=null;
            return temL3;
        }return null;
    }

    public static void main (String[] args) {
        // ListNode l17 = new ListNode(9,null);
        // ListNode l16 = new ListNode(9,l17);
        // ListNode l15 = new ListNode(9,l16);
        // ListNode l14 = new ListNode(9,l15);
        // ListNode l13 = new ListNode(9,l14);
        // ListNode l12 = new ListNode(9,l13);
        // ListNode l11 = new ListNode(9,l12);

        // ListNode l24 = new ListNode(9,null);
        // ListNode l23 = new ListNode(9,l24);
        // ListNode l22 = new ListNode(9,l23);
        // ListNode l21 = new ListNode(9,l22);
        // ListNode l02 = new ListNode(3,null);
        
        // System.out.println();
        // System.out.println("main");
        // ListNode curr = new ListNode();
        // curr=l11;
        // while (curr!=null) {System.out.print(curr.val+" "); curr=curr.next;}
        // System.out.println();
        // curr=l21;
        // while (curr!=null) {System.out.print(curr.val+" "); curr=curr.next;}
        // System.out.println();

        // ListNode l3 = addTwoNumbers(l11,l21);
        // curr=l3;
        // while (curr!=null) {System.out.print(curr.val+" "); curr=curr.next;}
        // System.out.println();

        // ListNode l02 = new ListNode(3,null);
        // ListNode l01 = new ListNode(4,l02);
        // ListNode l1 = new ListNode(2,l01);
        // ListNode l04 = new ListNode(4,null);
        // ListNode l03 = new ListNode(6,l04);
        // ListNode l2 = new ListNode(5,l03);
        
        // System.out.println();
        // System.out.println("main");
        // ListNode curr = new ListNode();
        // curr=l1;
        // while (curr!=null) {System.out.print(curr.val+" "); curr=curr.next;}
        // System.out.println();
        // curr=l2;
        // while (curr!=null) {System.out.print(curr.val+" "); curr=curr.next;}
        // System.out.println();

        // ListNode l3 = addTwoNumbers(l1,l2);
        // curr=l3;
        // System.out.println();
        // while (curr!=null) {System.out.print(curr.val+" "); curr=curr.next;}
        // System.out.println();

        // ListNode l17 = new ListNode(9,null);
        // ListNode l16 = new ListNode(9,l17);
        // ListNode l15 = new ListNode(9,l16);
        // ListNode l14 = new ListNode(2,null);
        // ListNode l13 = new ListNode(9,l14);
        ListNode l12 = new ListNode(7,null);
        ListNode l11 = new ListNode(3,l12);

        // ListNode l24 = new ListNode(9,null);
        // ListNode l23 = new ListNode(9,l24);
        ListNode l22 = new ListNode(2,null);
        ListNode l21 = new ListNode(9,l22);
        
        System.out.println();
        System.out.println("main");
        ListNode curr = new ListNode();
        curr=l11;
        while (curr!=null) {System.out.print(curr.val+" "); curr=curr.next;}
        System.out.println();
        curr=l21;
        while (curr!=null) {System.out.print(curr.val+" "); curr=curr.next;}
        System.out.println();

        ListNode l3 = addTwoNumbers(l11,l21);
        curr=l3;
        System.out.println();
        while (curr!=null) {System.out.print(curr.val+" "); curr=curr.next;}
        System.out.println();
    }
}