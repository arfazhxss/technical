public class Node<T> {
    private T data;
    private Node<T> next;

    public Node(T data) {
        this.data = data;
        this.next = null;
    }

    public T getData() {
        return this.data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Node<T> getNext() {
        return this.next;
    }

    public void setNext(Node<T> next) {
        this.next = next;
    }

    public boolean hasNext() {
        return this.next != null;
    }

    public static <T> void printList(Node<T> head) {
        Node<T> curr = head;
        while (curr != null) {
            System.out.print(curr.getData() + " ");
            curr = curr.getNext();
        }
        System.out.println();
    }

    public static <T> Node<T> reverseList(Node<T> head) {
        Node<T> prev = null;
        Node<T> curr = head;
        while (curr != null) {
            Node<T> next = curr.getNext();
            curr.setNext(prev);
            prev = curr;
            curr = next;
        }
        return prev;
    }

    public static <T> boolean isPalindrome(Node<T> head) {
        if (head == null) {
            return true;
        }

        Node<T> slow = head;
        Node<T> fast = head;

        while (fast != null && fast.getNext() != null) {
            slow = slow.getNext();
            fast = fast.getNext().getNext();
        }

        if (fast != null) {
            slow = slow.getNext();
        }

        slow = reverseList(slow);
        fast = head;

        while (slow != null) {
            if (!fast.getData().equals(slow.getData())) {
                return false;
            }
            fast = fast.getNext();
            slow = slow.getNext();
        }

        return true;
    }
}

