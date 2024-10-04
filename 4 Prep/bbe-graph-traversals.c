#include <stdio.h>
#include <stdlib.h>

// Define a structure for the graph node
struct Node {
    int vertex;               // The vertex number
    struct Node* next;        // Pointer to the next node in the adjacency list
};

// Define a structure for the graph
struct Graph {
    int numVertices;          // Number of vertices in the graph
    struct Node** adjLists;   // Array of adjacency lists
};

// Function to create a graph with a given number of vertices
struct Graph* createGraph(int vertices) {
    struct Graph* graph = (struct Graph*)malloc(sizeof(struct Graph));
    graph->numVertices = vertices;

    // Allocate memory for adjacency lists
    graph->adjLists = (struct Node**)malloc(vertices * sizeof(struct Node*));

    // Initialize each adjacency list as empty
    for (int i = 0; i < vertices; i++) {
        graph->adjLists[i] = NULL;
    }
    return graph;
}

// Function to create a new adjacency list node
struct Node* createNode(int vertex) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->vertex = vertex;
    newNode->next = NULL;
    return newNode;
}

// Function to add an edge to the graph (for an undirected graph)
void addEdge(struct Graph* graph, int src, int dest) {
    // Add an edge from src to dest
    struct Node* newNode = createNode(dest);
    newNode->next = graph->adjLists[src];
    graph->adjLists[src] = newNode;

    // Since the graph is undirected, add an edge from dest to src as well
    newNode = createNode(src);
    newNode->next = graph->adjLists[dest];
    graph->adjLists[dest] = newNode;
}

// DFS function
void DFSUtil(struct Graph* graph, int vertex, int* visited) {
    // Mark the current node as visited
    visited[vertex] = 1;
    printf("%d ", vertex);  // Visit the vertex

    // Recur for all the vertices adjacent to this vertex
    struct Node* temp = graph->adjLists[vertex];
    while (temp) {
        int connectedVertex = temp->vertex;
        if (!visited[connectedVertex]) {
            DFSUtil(graph, connectedVertex, visited);
        }
        temp = temp->next;
    }
}

// Wrapper function for DFS
void DFS(struct Graph* graph, int startVertex) {
    int* visited = (int*)malloc(graph->numVertices * sizeof(int)); // Create a visited array
    for (int i = 0; i < graph->numVertices; i++) {
        visited[i] = 0;  // Initialize all vertices as not visited
    }
    DFSUtil(graph, startVertex, visited); // Start the DFS from the given vertex
    free(visited); // Free the allocated memory for the visited array
}

// BFS function
void BFS(struct Graph* graph, int startVertex) {
    int* visited = (int*)malloc(graph->numVertices * sizeof(int)); // Create a visited array
    for (int i = 0; i < graph->numVertices; i++) {
        visited[i] = 0;  // Initialize all vertices as not visited
    }

    int* queue = (int*)malloc(graph->numVertices * sizeof(int)); // Create a queue
    int front = 0; // Points to the front of the queue
    int rear = 0;  // Points to the rear of the queue

    // Mark the start vertex as visited and enqueue it
    visited[startVertex] = 1;
    queue[rear++] = startVertex;

    while (front < rear) {
        // Dequeue a vertex from the queue
        int currentVertex = queue[front++];
        printf("%d ", currentVertex); // Visit the vertex

        // Get all adjacent vertices of the dequeued vertex
        struct Node* temp = graph->adjLists[currentVertex];
        while (temp) {
            int adjacentVertex = temp->vertex;
            if (!visited[adjacentVertex]) {
                // Mark it as visited and enqueue it
                visited[adjacentVertex] = 1;
                queue[rear++] = adjacentVertex;
            }
            temp = temp->next;
        }
    }
    
    free(visited); // Free the allocated memory for the visited array
    free(queue);   // Free the allocated memory for the queue
}

// Main function to demonstrate graph traversal
int main() {
    struct Graph* graph = createGraph(6); // Create a graph with 6 vertices

    // Add edges to the graph
    addEdge(graph, 0, 1);
    addEdge(graph, 0, 2);
    addEdge(graph, 1, 2);
    addEdge(graph, 1, 3);
    addEdge(graph, 2, 4);
    addEdge(graph, 3, 4);
    addEdge(graph, 4, 5);

    printf("DFS traversal starting from vertex 0:\n");
    DFS(graph, 0); // Perform DFS starting from vertex 0
    printf("\n");

    printf("BFS traversal starting from vertex 0:\n");
    BFS(graph, 0); // Perform BFS starting from vertex 0
    printf("\n");

    // Free the memory for the graph
    for (int i = 0; i < graph->numVertices; i++) {
        struct Node* temp = graph->adjLists[i];
        while (temp) {
            struct Node* toFree = temp;
            temp = temp->next;
            free(toFree);
        }
    }
    free(graph->adjLists);
    free(graph);

    return 0;
}

