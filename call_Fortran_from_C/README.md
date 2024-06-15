# Call C from Fortran

These examples illustrate how to call C functions from Fortran, covering various scenarios including functions with scalar numeric variables called by value or by reference, explicit-size array arguments, and struct arguments with struct result.

## 1. Functions with _scalar_ variables called by _value_ or by _reference_

```fortran
integer function print_args(i, f, d, cd, c, b)
    integer, intent(in) :: i
    real(real32), intent(in) :: f
    real(real64), intent(in) :: d
    complex(real64), intent(in) :: cd
    character, intent(in) :: c
    logical, intent(in) :: b
end function
```

## 2. Functions with _uni- and mutidimensional array_ arguments

```c
double euclidean_distance(const double point1[3], const double point2[3]);

void add_vectors(int length, const int vec1[], const int vec2[], int result[]);

int *add_vectors_and_return(int length, const int vec1[], const int vec2[]);
```

References:

* https://fortran-lang.discourse.group/t/iso-c-binding-pass-an-array-from-c-to-fortran-edit-python-interop-content/514/9?u=hugomvale

## 3. Functions with _multidimensional array_ arguments

```c
void sum_cols(int rows, int cols, int matrix[rows][cols], int *result);
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

void apply_function_to_vector(func_ptr f, double *input_vector, double *output_vector, int length);
```

References:

* https://fortran-lang.discourse.group/t/iso-c-binding-pass-an-array-from-c-to-fortran-edit-python-interop-content/514/22?u=hugomvale
