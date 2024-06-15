program fprogram
   use iso_c_binding, only: c_int
   implicit none

   interface
      subroutine sum_cols(rows, cols, matrix, result) bind(C)
         import :: c_int
         integer(c_int), intent(in), value :: rows, cols
         integer(c_int), intent(in) :: matrix(cols, rows) ! Transposed
         integer(c_int), intent(out) :: result(rows)
      end subroutine
   end interface

   ! Declare arrays and variables
   integer, parameter :: rows = 2, cols = 3
   integer :: matrix(rows, cols), result(rows)
   integer :: i

   ! Initialize the matrix
   matrix(1, :) = [1, 2, 3]
   matrix(2, :) = [4, 5, 6]

   ! Call the C function
   ! Note that the C function expects the matrix to be transposed
   call sum_cols(rows, cols, transpose(matrix), result)

   ! Print the result
   do i = 1, size(result)
      print *, "Sum of row ", i, ": ", result(i)
   end do

end program fprogram
