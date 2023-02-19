public class palindromeLinkedList {
    public static boolean isPalindrome (ListNode head) {
        if (head==null) return true;
        ListNode fast = head;
        ListNode slow = head;

        while ((fast!=null)&&(slow!=null)) {
            fast = fast.next.next;
            slow = slow.next;
        }
        ListNode temp = reverseLinkedList (slow);

        while (temp!=null) {
            if (temp.val!=head.val) return false;
            else {
                temp = temp.next;
                head = head.next;
            }
        }
        return true;
    }
    public static ListNode reverseLinkedList (ListNode root) {
        ListNode out=null;
        while (root!=null) {
            ListNode temp = root.next;
            root.next = out;
            out = root;
            root = temp;
        }
        return out;
    }
    // TEST
    public static void addA (ListNode root, int value) {
        while (root.next!=null) {root=root.next;}
        ListNode curr = new ListNode(value,null);
        root.next=curr;
    }

    // public static void printA (ListNode root) {
    //     ListNode curr = root;
    //     while (curr.next!=null) {
    //         System.out.println(curr.val);
    //         curr=curr.next;
    //     }
    // }
    public static void main(String[] args) {
        ListNode mainlist = new ListNode(1, null);
        addA(mainlist, 2);
        addA(mainlist, 2);
        addA(mainlist, 1);
        System.out.println(isPalindrome(mainlist));
    }
}