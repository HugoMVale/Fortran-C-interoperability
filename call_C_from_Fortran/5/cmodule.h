#ifndef CMODULE_H
#define CMODULE_H

#define ARRAY_SIZE 10
#define STRING_SIZE 20

#include <stdbool.h>

typedef struct
{
    int int_component;
    float float_component;
    double array_component[ARRAY_SIZE];
    bool bool_component;
    char char_component;
    char string_component[STRING_SIZE];
} thing;

// Function that takes a struct thing and returns another struct thing
thing process_thing(const thing *t);

#endif // CMODULE_H
