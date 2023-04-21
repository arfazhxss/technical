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

    public static ListNode reverseLinkedList(ListNode root) {
        /*
         * Target: Take a list at a given position, like [1...5...1] or [7...9...7] or [3...9...3] where [-] is the linked list we are taking the root (in our example 5, 9) from AND cutting the list into two lists, both lists includes the ROOT (one at ending and one at beginning), and we need to make the second list that should start from the root and end at the end of the main list, and turn that into a reversed list (aka turning [1...5...1] into [1...5] and [5...1]).
         * 
         * 
         * 
         * STORAGE: List we are storing the 'second' list aka (MAIN LIST: [1...5...1] has FIRST as [1...5] and SECOND as [5...1])
         * 
         * ROOT: The median number in the MAIN list aka 5 of [1...5...1], 7 of [3...7...3]
         * 
         * TEMP: Temporary is holding the next root value aka [5...1] [4...1] [3...1] [2...1] [1] [null] at the very beginning and updating the root at the very end.
         * 
         */
        ListNode storage = null;
        while (root != null) {         // I (storage) null               // II (storage) 5, null           // III (storage) 4, 5, null  -----> (storage) 2, 3, 4, 5, null  
            ListNode temp = root.next; // (root) 5...1 (temp) 4...1      // (root) 4...1 (temp) 3...1      // (root) 3...1 (temp) 2...1 -----> (root) 1 (temp) null
            root.next = storage;       // (root) 5, null                 // (root) 4, 5, null              // (root) 4, 5, null         -----> (root) 1, 2, 3, 4, 5, null  
        /*
         *
         * This makes the main head linkedList cut out, since in the main array
         * [1,2,3,4,5,4,3,2,1], slow is stuck at 5, which is passed as a parameter as
         * 'root', the next of root is slayed to 'null' cutting the main 'head'
         * linkedlist into one [1,2,3,4,5].
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