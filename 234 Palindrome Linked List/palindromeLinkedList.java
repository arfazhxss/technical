public class palindromeLinkedList {
    public static boolean isPalindrome(ListNode head) {
        if (head == null)
            return true;
        ListNode fast = head;
        ListNode slow = head;

        System.out.print("head1:\t\t");
        printA(head);

        while (fast.next != null) {
            fast = fast.next.next;
            slow = slow.next;
        }

        // TestCode//ListNode temp = null;
        ListNode temp = reverseLinkedList(slow);

        System.out.print("head2:\t\t");
        printA(head);

        System.out.print("temp:\t\t");
        printA(temp);

        while (temp != null) {
            if (temp.val != head.val)
                return false;
            else {
                temp = temp.next;
                head = head.next;
            }
        }
        return true;
    }

    public static ListNode reverseLinkedList(ListNode located) {
        ListNode storage = null;
        while (root != null) {         // I (storage) null               // II (storage) 5, null           // III (storage) 4, 5, null  -----> (storage) 2, 3, 4, 5, null  
            ListNode temp = root.next; // (root) 5...1 (temp) 4...1      // (root) 4...1 (temp) 3...1      // (root) 3...1 (temp) 2...1 -----> (root) 1 (temp) null
            root.next = out;           // (root) 5, null                 // (root) 4, 5, null              // (root) 4, 5, null         -----> (root) 1, 2, 3, 4, 5, null  
        /* 
        This makes the main head 
        linkedList cut out, since in the 
        main array [1,2,3,4,5,4,3,2,1],  
        slow is stuck at 5, which is 
        passed as a parameter as 'root', 
        the next of root is slayed to 
        'null'  cutting the main 'head' 
        linkedlist into one [1,2,3,4,5]. 
        */
            storage = root;             // (storage) 5, null            // (storage) 4, 5, null             // (storage) 3, 4, 5, null  -----> (storage) 1, 2, 3, 4, 5, null
            root = temp;                // (root) 4...1                 // (root) 3...1                     // (root) 2...1             -----> (root) null
        }
        return storage;
    }

    // TEST
    public static void addA(ListNode root, int value) {
        while (root.next != null) {
            root = root.next;
        }
        ListNode curr = new ListNode(value, null);
        root.next = curr;
    }

    public static void printA(ListNode root) {
        ListNode curr = root;
        do {
            System.out.print(curr.val + " ");
            curr = curr.next;
        } while (curr != null);

        System.out.println("[end]");
    }

    public static void main(String[] args) {
        ListNode mainlist = new ListNode(1, null);
        addA(mainlist, 2);
        addA(mainlist, 3);
        addA(mainlist, 4);
        addA(mainlist, 5);
        addA(mainlist, 4);
        addA(mainlist, 3);
        addA(mainlist, 2);
        addA(mainlist, 1);
        // printA(mainlist);
        System.out.println("ActualValue:\t" + isPalindrome(mainlist));
    }
}