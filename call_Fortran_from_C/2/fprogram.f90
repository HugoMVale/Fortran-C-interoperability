program fprogram
   use fmodule
   implicit none

   integer, parameter :: rows = 2, cols = 3
   integer :: matrix(rows, cols), vector(cols), result(rows)
   integer :: i

   ! Example values for the matrix
   matrix = reshape([1, 2, 3, 4, 5, 6], shape(matrix))

   ! Example values for the vector
   vector = [1, 2, 3]

   ! Call the subroutine to compute the matrix-vector product
   call matvec_product(matrix, vector, result)

   ! Print the result
   print *, 'Matrix:'
   do i = 1, rows
      print *, matrix(i, :)
   end do

   print *, 'Vector:'
   do i = 1, size(vector)
      print *, vector(i)
   end do

   print *, 'Matrix-Vector Product:'
   do i = 1, size(result)
      print *, result(i)
   end do

end program fprogram
