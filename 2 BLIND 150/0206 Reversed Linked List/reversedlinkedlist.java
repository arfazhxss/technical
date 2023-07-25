class reversedlinkedlist 
{
    public ListNode reversedlinkedlist (ListNode head) 
    {
        LinkedNode output = null;
        while (head != null) 
        {
            ListNode temp = head.next;
            head.next = output;
            output = head;
            head = temp;
        }
        return output;
    }
}