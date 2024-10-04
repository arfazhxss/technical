#include <stdio.h>
#include <stdlib.h>

// Define the structure for a node in the binary tree
struct Node {
    int data;            // The value/data of the node
    struct Node* left;   // Pointer to the left child
    struct Node* right;  // Pointer to the right child
};

// Function to create a new node
struct Node* createNode(int data) {
    // Allocate memory for a new node
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    // Set the data and initialize children to NULL
    newNode->data = data;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

// Inorder traversal: Left, Root, Right
void inorderTraversal(struct Node* root) {
    if (root == NULL) {
        return;  // Base case: If the node is NULL, do nothing
    }
    
    // Traverse the left subtree
    inorderTraversal(root->left);
    
    // Visit the root node
    printf("%d ", root->data);
    
    // Traverse the right subtree
    inorderTraversal(root->right);
}

// Preorder traversal: Root, Left, Right
void preorderTraversal(struct Node* root) {
    if (root == NULL) {
        return;  // Base case: If the node is NULL, do nothing
    }
    
    // Visit the root node
    printf("%d ", root->data);
    
    // Traverse the left subtree
    preorderTraversal(root->left);
    
    // Traverse the right subtree
    preorderTraversal(root->right);
}

// Postorder traversal: Left, Right, Root
void postorderTraversal(struct Node* root) {
    if (root == NULL) {
        return;  // Base case: If the node is NULL, do nothing
    }
    
    // Traverse the left subtree
    postorderTraversal(root->left);
    
    // Traverse the right subtree
    postorderTraversal(root->right);
    
    // Visit the root node
    printf("%d ", root->data);
}

int main() {
    // Manually creating a binary tree for demonstration
    /*
                1
               / \
              2   3
             / \   \
            4   5   6
    */
    
    // Create the root node
    struct Node* root = createNode(1);
    
    // Manually create the rest of the tree
    root->left = createNode(2);
    root->right = createNode(3);
    root->left->left = createNode(4);
    root->left->right = createNode(5);
    root->right->right = createNode(6);
    
    // Display traversals
    printf("Inorder traversal: ");
    inorderTraversal(root);  // Should print 4 2 5 1 3 6
    printf("\n");
    
    printf("Preorder traversal: ");
    preorderTraversal(root);  // Should print 1 2 4 5 3 6
    printf("\n");
    
    printf("Postorder traversal: ");
    postorderTraversal(root);  // Should print 4 5 2 6 3 1
    printf("\n");
    
    return 0;
}

