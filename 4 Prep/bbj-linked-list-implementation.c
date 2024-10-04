#include <stdio.h>
#include <stdlib.h>

// Enum for different linked list operations
typedef enum {
    INSERT_AT_BEGINNING,
    INSERT_AT_END,
    DELETE_NODE,
    DELETE_LIST
} OperationType;

// Define a struct for the linked list node using typedef for convenience
typedef struct Node {
    int data;                // The data held by the node
    struct Node* next;       // Pointer to the next node in the list
} Node;

// Function to insert a new node at the beginning of the list
void insertAtBeginning(Node** head, int newData) {
    // Allocate memory for the new node
    Node* newNode = (Node*) malloc(sizeof(Node));
    
    // Check if memory allocation failed
    if (newNode == NULL) {
        printf("Memory allocation failed\n");
        return;
    }
    
    // Set data for the new node and make it point to the current head
    newNode->data = newData;
    newNode->next = (*head);
    
    // Update the head to point to the new node
    (*head) = newNode;
}

// Function to insert a node at the end of the list
void insertAtEnd(Node** head, int newData) {
    // Allocate memory for the new node
    Node* newNode = (Node*) malloc(sizeof(Node));
    
    if (newNode == NULL) {
        printf("Memory allocation failed\n");
        return;
    }

    newNode->data = newData;
    newNode->next = NULL;  // New node will be the last, so it points to NULL

    // If the list is empty, make the new node the head
    if (*head == NULL) {
        *head = newNode;
        return;
    }

    // Otherwise, traverse to the last node
    Node* temp = *head;
    while (temp->next != NULL) {
        temp = temp->next;
    }
    
    // Point the last node to the new node
    temp->next = newNode;
}

// Function to delete a node by its value
void deleteNode(Node** head, int key) {
    Node* temp = *head;  // Store head node
    Node* prev = NULL;

    // If the head node itself holds the key
    if (temp != NULL && temp->data == key) {
        *head = temp->next;  // Update the head
        free(temp);          // Free the old head
        return;
    }

    // Search for the key
    while (temp != NULL && temp->data != key) {
        prev = temp;
        temp = temp->next;
    }

    // If the key was not present
    if (temp == NULL) {
        printf("Key %d not found in the list.\n", key);
        return;
    }

    // Unlink the node from the linked list
    prev->next = temp->next;

    // Free memory of the deleted node
    free(temp);
}

// Function to delete the entire linked list
void deleteList(Node** head) {
    Node* current = *head;
    Node* next;

    while (current != NULL) {
        next = current->next;  // Store the next node
        free(current);         // Free the current node
        current = next;        // Move to the next node
    }

    *head = NULL;  // Finally, update head to NULL
    printf("Linked list deleted successfully.\n");
}

// Function to remove all nodes with a specific value
void removeAllOccurrences(Node** head, int value) {
    Node* temp = *head;
    Node* prev = NULL;

    // Remove nodes at the head with the specific value
    while (temp != NULL && temp->data == value) {
        *head = temp->next;  // Update head
        free(temp);          // Free the old head
        temp = *head;        // Move to the new head
    }

    // Traverse the list and remove nodes with the specific value
    while (temp != NULL) {
        // If the current node has the target value
        if (temp->data == value) {
            prev->next = temp->next;  // Bypass the current node
            free(temp);               // Free memory of the node
            temp = prev->next;        // Move to the next node
        } else {
            // Move both pointers forward
            prev = temp;
            temp = temp->next;
        }
    }
}

// Function to insert a node at a specific position (0-based index)
void insertAtPosition(Node** head, int newData, int position) {
    // Allocate memory for the new node
    Node* newNode = (Node*) malloc(sizeof(Node));
    
    if (newNode == NULL) {
        printf("Memory allocation failed\n");
        return;
    }

    newNode->data = newData;
    
    // If the position is at the head (position 0)
    if (position == 0) {
        newNode->next = *head;
        *head = newNode;
        return;
    }

    Node* temp = *head;
    int count = 0;

    // Traverse to the node just before the desired position
    while (temp != NULL && count < position - 1) {
        temp = temp->next;
        count++;
    }

    // If the position is out of bounds
    if (temp == NULL) {
        printf("Position %d is out of range.\n", position);
        free(newNode);  // Free allocated memory as we cannot insert
        return;
    }

    // Insert the new node at the desired position
    newNode->next = temp->next;
    temp->next = newNode;
}

// Function to find and return the middle node of the linked list
Node* findMiddleNode(Node** head) {
    if (head == NULL) return NULL;

    Node* slow = *head;
    Node* fast = *head;

    // Move fast pointer twice as fast as the slow pointer
    while (fast != NULL && fast->next != NULL) {
        slow = slow->next;
        fast = fast->next->next;
    }

    return slow;  // Slow pointer will now be at the middle node
}

// Function to detect if a loop exists in the linked list
int detectLoop(Node** head) {
    Node* slow = *head;
    Node* fast = *head;

    // Move slow by 1 and fast by 2
    while (slow != NULL && fast != NULL && fast->next != NULL) {
        slow = slow->next;
        fast = fast->next->next;

        // If slow and fast meet, there is a loop
        if (slow == fast) {
            return 1;  // Loop detected
        }
    }

    return 0;  // No loop detected
}

// Function to print the entire linked list
void printList(Node* node) {
    while (node != NULL) {
        printf("%d -> ", node->data);  // Print current node's data
        node = node->next;             // Move to next node
    }
    printf("NULL\n");
}

Node* mergeSortedLists(Node** head1, Node** head2) {
    // Base cases for empty lists
    if (*head1 == NULL) return *head2;
    if (*head2 == NULL) return *head1;

    // Temporary pointers for easier access
    Node* first = *head1;
    Node* second = *head2;

    Node* result = NULL;

    // Compare data of both lists and recursively merge them
    if (first->data <= second->data) {
        result = first;
        result->next = mergeSortedLists(&first->next, head2);  // Pass the address of the next node
    } else {
        result = second;
        result->next = mergeSortedLists(head1, &second->next);  // Pass the address of the next node
    }

    return result;
}

// Utility function to count the number of nodes in the linked list
int countNodes(Node* head) {
    int count = 0;
    Node* current = head;
    while (current != NULL) {
        count++;
        current = current->next;
    }
    return count;
}

// Function to find the nth node from the end of the linked list
Node* findNthFromEnd(Node* head, int n) {
    Node* mainPtr = head;
    Node* refPtr = head;

    int count = 0;

    // Move the reference pointer n steps ahead
    while (count < n) {
        if (refPtr == NULL) {
            printf("List has fewer than %d nodes.\n", n);
            return NULL;
        }
        refPtr = refPtr->next;
        count++;
    }

    // Move both pointers until the reference pointer reaches the end
    while (refPtr != NULL) {
        mainPtr = mainPtr->next;
        refPtr = refPtr->next;
    }

    // The main pointer will now be at the nth node from the end
    return mainPtr;
}

// Function to get the nth node in the linked list
Node* getNode(Node* head, int position) {
    int count = 0;
    Node* current = head;

    // Traverse the list until the position is found
    while (current != NULL) {
        if (count == position) {
            return current;  // Return the node at the position
        }
        count++;
        current = current->next;
    }

    // If the position is out of range
    printf("Position %d is out of range\n", position);
    return NULL;
}

// Main function demonstrating the linked list operations
int main() {
    Node* head = NULL;  // Initialize the linked list as empty
    
    // Insert elements into the linked list
    insertAtBeginning(&head, 10);  // List: 10 -> NULL
    insertAtBeginning(&head, 20);  // List: 20 -> 10 -> NULL
    insertAtEnd(&head, 30);        // List: 20 -> 10 -> 30 -> NULL
    insertAtEnd(&head, 40);        // List: 20 -> 10 -> 30 -> 40 -> NULL

    // Print the current list
    printf("Linked List after insertions: ");
    printList(head);
    
    // Count the number of nodes in the linked list
    printf("Number of nodes: %d\n", countNodes(head));

    // Get and print the node at position 2 (0-based index)
    Node* node = getNode(head, 2);
    if (node != NULL) {
        printf("Node at position 2: %d\n", node->data);
    }

    // Delete a node with value 10
    deleteNode(&head, 10);  // List becomes: 20 -> 30 -> 40 -> NULL
    printf("Linked List after deletion of 10: ");
    printList(head);
    
    // Delete the entire linked list
    deleteList(&head);      // List becomes: NULL
    printf("Linked List after deleting all nodes: ");
    printList(head);        // Should print: NULL
    
    return 0;
}

