program fprogram
    use iso_c_binding, only: c_int
    implicit none

    ! Function prototypes for C functions
    interface
        subroutine sum_cols(rows, cols, matrix, result) bind(C)
            import c_int
            integer(c_int), value :: rows, cols
            integer(c_int), dimension(cols, rows) :: matrix ! Transposed
            integer(c_int), dimension(rows) :: result
        end subroutine
    end interface

    ! Declare arrays and variables
    integer, parameter :: ROWS = 2
    integer, parameter :: COLS = 3
    integer :: matrix(ROWS, COLS), result(ROWS)
    integer :: i

    ! Initialize the matrix
    matrix(1,:) = [1, 2, 3]
    matrix(2,:) = [4, 5, 6]

    ! Call the C funciton
    call sum_cols(ROWS, COLS, transpose(matrix), result)

    ! Print the result
    do i = 1, ROWS 
        print *, "Sum of row ", i, ": ", result(i)
    end do

end program fprogram
