#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _node {
    char* key;
    char* value;
    struct _node* next;
} Node;

Node* node_create(char* key, char* value) {
    Node* n = malloc(sizeof(Node));

    n->key = malloc(sizeof(char) * (strlen(key) + 1));
    strcpy(n->key, key);

    n->value = malloc(sizeof(char) * (strlen(value) + 1));
    strcpy(n->value, value);

    n->next = NULL;

    return n;
}

Node* node_append(Node* n, char* key, char* value) {
    Node* new_n = node_create(key, value);

    n->next = new_n;

    return new_n;
}

void node_destroy(Node* n) {
    printf("Freeing node (key: %s)!\n", n->key);

    free(n->key);
    free(n->value);
    free(n);
}
