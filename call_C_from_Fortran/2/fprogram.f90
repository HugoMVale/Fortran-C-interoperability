program fprogram
    use iso_c_binding, only: c_int
    implicit none

    ! Function prototypes for C functions
    interface
        subroutine add_vectors(length, vec1, vec2, result) bind(c, name="add_vectors")
            import :: c_int
            implicit none
            integer(c_int), value :: length
            integer(c_int), intent(in) :: vec1(length), vec2(length)
            integer(c_int), intent(out) :: result(length)
            
        end subroutine add_vectors

        subroutine add_matrices(rows, cols, mat1, mat2, result) bind(c, name="add_matrices")
            import :: c_int
            implicit none
            integer(c_int), value :: rows
            integer(c_int), value :: cols
            integer(c_int), intent(in) :: mat1(rows, cols), mat2(rows, cols)
            integer(c_int), intent(out) :: result(rows, cols)
        end subroutine add_matrices
    end interface

    ! Declare arrays and variables
    integer, parameter :: VEC_LENGTH = 3
    integer, parameter :: MAT_ROWS = 2
    integer, parameter :: MAT_COLS = 3
    integer, dimension(VEC_LENGTH) :: vec1, vec2, vec_result
    integer, dimension(MAT_ROWS, MAT_COLS) :: mat1, mat2, mat_result
    integer :: i

    ! Initialize vectors and matrices
    vec1 = [1, 2, 3]
    vec2 = [4, 5, 6]
    mat1 = reshape([1, 2, 3, 4, 5, 6], shape=[MAT_ROWS, MAT_COLS])
    mat2 = reshape([9, 8, 7, 6, 5, 4], shape=[MAT_ROWS, MAT_COLS])
    mat_result = 0

    ! Call add_vectors function
    call add_vectors(VEC_LENGTH, vec1, vec2, vec_result)

    ! Display the result vector
    print *, "Result Vector (add_vectors):"
    print *, vec_result

    ! Call add_matrices function
    call add_matrices(MAT_ROWS, MAT_COLS, mat1, mat2, mat_result)

    ! Display the result matrix
    print *, "Result Matrix (add_matrices):"
    do i=1, MAT_ROWS
        print *, mat1(i, :)
    end do

end program fprogram
