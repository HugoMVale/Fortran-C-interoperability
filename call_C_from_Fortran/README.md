# Call C from Fortran

This guide illustrates how to call C functions from Fortran, covering various scenarios including functions with scalar numeric variables called by value or by reference, explicit-size array arguments, and struct arguments with struct result.

## Case 1 
Functions with _scalar numeric variables called by value or by reference_.
```c
double power_by_value(double base, int exponent);

void power_by_reference(double *base, int *exponent, double *result);
```

## Case 2

Functions with _explicit-size array_ arguments.

```c
void add_vectors(int length, const int *vec1, const int *vec2, int *result);
```

## Case 4

Function with _struct argument and struct result_.

```c
typedef struct
{
    int int_component;
    float float_component;
    double array_component[ARRAY_SIZE];
    bool bool_component;
    char char_component;
    char string_component[STRING_SIZE];
} thing;

thing process_thing(const thing *t);
```
