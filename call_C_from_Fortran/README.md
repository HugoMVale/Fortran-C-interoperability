# Call C from Fortran

These examples illustrate how to call C functions from Fortran, covering various scenarios including functions with scalar, explicit-size array, struct and callback arguments.

## Basic principles

* On the C-side, no changes are required.
* On the Fortran-side, write `interfaces` with `bind(C)` for the C-functions you wish to call.
    * The interface declaration must match the C-function prototype.
    * Add `value` for arguments passed by value (default in C).
    * Specify argument `intent()` as form of "documentation" (not sure if/when the compiler uses the info).
    * Type mapping for scalar arguments is straightforward. Check any interoperation table.
    * Type mapping for array and pointer arguments is less straightforward. The examples below are meant to help.
    * Keep in mind that the index order in multidimensional arrays is reversed, because Fortran uses column-major order and C uses row-major order.

## 1. Functions with _scalar_ variables called by _value_ or by _reference_

```c
void print_args(int i, int *ip, float f, float *fp, double d, double *dp,
                _Complex double cd, _Complex double *cdp, char c, char *cp, _Bool b);
```

## 2. Functions with _unidimensional array_ arguments

```c
double euclidean_distance(const double point1[3], const double point2[3]);

void add_vectors(int length, const int vec1[], const int vec2[], int result[]);

int *add_vectors_and_return(int length, const int vec1[], const int vec2[]);
```

References:

* https://fortran-lang.discourse.group/t/iso-c-binding-pass-an-array-from-c-to-fortran-edit-python-interop-content/514/9?u=hugomvale

## 3. Functions with _multidimensional array_ arguments

```c
void sum_cols(int rows, int cols, const int matrix[rows][cols], int *result);
```

## 4. Functions with _C-string_ arguments

```c
void to_uppercase(char *str);
```

References:

* https://fortran-lang.discourse.group/t/iso-c-binding-pass-an-array-from-c-to-fortran-edit-python-interop-content/514/9?u=hugomvale

## 5. Function with _struct argument_ and _struct result_

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

## 6. Functions with _function_ arguments

```c
typedef double (*func_ptr)(double);

void apply_function_to_vector(func_ptr f, const double *input_vector, double *output_vector, int length);
```

References:

* https://fortran-lang.discourse.group/t/iso-c-binding-pass-an-array-from-c-to-fortran-edit-python-interop-content/514/22?u=hugomvale
