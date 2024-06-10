# Call C from Fortran

These examples illustrate how to call C functions from Fortran, covering various scenarios including functions with scalar numeric variables called by value or by reference, explicit-size array arguments, and struct arguments with struct result.

## Case 1

Functions with _scalar_ variables called by _value_ or by _reference_.

```c
void print_args(int i, int *ip, float f, float *fp, double d, double *dp,
                _Complex double cd, _Complex double *cdp, char c, char *cp, _Bool b);
```

## Case 2

Functions with _unidimensional array_ arguments.

```c
double euclidean_distance(const double point1[3], const double point2[3]);

void add_vectors(int length, const int vec1[], const int vec2[], int result[]);

int *add_vectors_and_return(int length, const int vec1[], const int vec2[]);
```

## Case 3

Functions with _multidimensional array_ arguments.

tbd

## Case 4

Function with _struct argument_ and _struct result_.

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

## Case 5

Functions with _function_ arguments.

tbd
