module fmodule
   use, intrinsic :: iso_c_binding, only: c_int
   implicit none
   private

   public :: matvec_product, matvec_product_c

contains

   subroutine matvec_product(matrix, vector, result)
      integer, dimension(:, :), intent(in) :: matrix
      integer, dimension(:), intent(in) :: vector
      integer, dimension(:), intent(inout) :: result

      integer :: i, j

      result = 0
      do j = 1, size(matrix, 2)
         do i = 1, size(matrix, 1)
            result(i) = result(i) + matrix(i, j)*vector(j)
         end do
      end do

   end subroutine

   subroutine matvec_product_c(rows, cols, matrix, vector, result) bind(C)
      ! C-wrapper with explicit-shape arrays
      integer(c_int), intent(in), value :: rows, cols
      integer(c_int), intent(in) :: matrix(rows, cols)
      integer(c_int), intent(in) :: vector(rows)
      integer(c_int), intent(inout) :: result(rows)

      integer :: i

      ! print the matrix
      print *, "Matrix received by Fortran:"
      do i = 1, rows
         print *, matrix(i, :)
      end do

      call matvec_product(matrix, vector, result)
   end subroutine

end module fmodule
