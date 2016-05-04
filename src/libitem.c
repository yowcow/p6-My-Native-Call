#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _item {
    uint32_t id;
    char* name;
} Item;

Item* item_create(uint32_t id, char* name) {
    Item* item = malloc(sizeof(Item));

    item->id = id;

    item->name = malloc(sizeof(char) * (strlen(name) + 1));
    strcpy(item->name, name);

    return item;
}

void item_destroy(Item* item) {
    free(item->name);
    free(item);
    printf("Item freed!\n");
}
