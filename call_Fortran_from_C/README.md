# Call Fortran from C

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

```fortran
subroutine matvec_product(matrix, vector, result)
    integer, dimension(:, :), intent(in) :: matrix
    integer, dimension(:), intent(in) :: vector
    integer, dimension(:), intent(inout) :: result
end subroutine
```
