#include "cmodule.h"
#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Function that takes a struct thing and returns another struct thing
thing process_thing(const thing *t)
{
    thing new_thing;
    int i;

    // Process numerical components to have the opposite sign
    new_thing.int_component = -t->int_component;
    new_thing.float_component = -t->float_component;

    // Process array component to have the opposite sign
    for (i = 0; i < ARRAY_SIZE; ++i)
    {
        new_thing.array_component[i] = -t->array_component[i];
    }

    // Process bool component to be inverted
    new_thing.bool_component = !t->bool_component;

    // Process char component to be upper case
    new_thing.char_component = toupper(t->char_component);

    // Process string component to be upper case
    for (i = 0; i < STRING_SIZE; ++i)
    {
        new_thing.string_component[i] = toupper(t->string_component[i]);
    }

    return new_thing;
}
