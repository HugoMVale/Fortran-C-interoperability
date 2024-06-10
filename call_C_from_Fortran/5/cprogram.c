#include <stdio.h>
#include "cmodule.h"

int main()
{
    // Create a thing struct
    thing my_thing;
    my_thing.int_component = 42;
    my_thing.float_component = 3.14;
    my_thing.char_component = 'a';
    my_thing.bool_component = true;
    for (int i = 0; i < ARRAY_SIZE; ++i)
    {
        my_thing.array_component[i] = i + 1;
    }
    snprintf(my_thing.string_component, STRING_SIZE, "Hello, World!");

    // Process the thing struct
    thing processed_thing = process_thing(&my_thing);

    // Print the original thing
    printf("Original struct thing:\n");
    printf("int_component: %d\n", my_thing.int_component);
    printf("float_component: %.2f\n", my_thing.float_component);
    printf("char_component: %c\n", my_thing.char_component);
    printf("bool_component: %s\n", my_thing.bool_component ? "true" : "false");
    printf("array_component: ");
    for (int i = 0; i < ARRAY_SIZE; ++i)
    {
        printf("%.2f ", my_thing.array_component[i]);
    }
    printf("\nstring_component: %s\n", my_thing.string_component);

    // Print the processed thing
    printf("\nProcessed struct thing:\n");
    printf("int_component: %d\n", processed_thing.int_component);
    printf("float_component: %.2f\n", processed_thing.float_component);
    printf("char_component: %c\n", processed_thing.char_component);
    printf("bool_component: %s\n", processed_thing.bool_component ? "true" : "false");
    printf("array_component: ");
    for (int i = 0; i < ARRAY_SIZE; ++i)
    {
        printf("%.2f ", processed_thing.array_component[i]);
    }
    printf("\nstring_component: %s\n", processed_thing.string_component);

    return 0;
}
