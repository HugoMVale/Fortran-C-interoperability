# Call Fortran from C

These examples illustrate how to call Fortran procedures from C, covering various scenarios including functions with scalar variables, explicit-size arrays, and callback functions.

## Basic principles

* On the Fortran-side, write _wrappers_ with `bind(C)` for the Fortran procedures you wish call from C.
    * The wrapper is meant to deal with the specific constraints of Fortran-C interoperability, while keeping the original Fortran procedure unchanged.
    * The wrapper does _not_ need to be declared public.
    * Optionally add `value` for arguments that you prefer to pass by value (to make the API more C-like).
    * Specify argument `intent()` as form of "documentation" (not sure if/when the compiler uses the info).
    * Type mapping for scalar arguments is straightforward. Check any interoperation table.
    * Convert assumed-shape arrays to explicit-shape arrays. If you don't want to do this, then you need to use a C descriptor on the C code (which is not simpler).
    * Keep in mind that the index order in multidimensional arrays is reversed, because Fortran uses column-major order and C uses row-major order.
* On the C-side, write a header file with the prototypes of the _external_ Fortran functions.

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

```fortran
subroutine matvec_product(matrix, vector, result)
    integer, dimension(:, :), intent(in) :: matrix
    integer, dimension(:), intent(in) :: vector
    integer, dimension(:), intent(inout) :: result
end subroutine
```

## 3. Functions with _character_ array arguments

```fortran
subroutine open_file(unit, filename)
    integer, intent(in) :: unit
    character(len=*) :: filename
end subroutine
```

## 4. Functions with _callback_ arguments

```fortran
subroutine integrate(f, a, b, n, result)
    procedure(fx) :: f
    real, intent(in) :: a, b
    integer, intent(in) :: n
    real, intent(out) :: result
end subroutine

abstract interface
    real function fx(x)
        implicit none
        real, intent(in) :: x
    end function
end interface
```