module fmodule
   use, intrinsic :: iso_c_binding, only: c_funptr, c_ptr, c_float, c_int
   implicit none
   private

   public :: integrate

   abstract interface
      real function fx(x)
         implicit none
         real, intent(in) :: x
      end function
   
      real(c_float) function fx_c(x) bind(C)
         import :: c_float
         implicit none
         real(c_float), intent(in) :: x
      end function

   end interface

contains

   subroutine integrate(f, a, b, n, result)
      procedure(fx) :: f
      real, intent(in) :: a, b
      integer, intent(in) :: n
      real, intent(out) :: result

      ! Local variables
      real :: h, x, sum
      integer :: i

      ! Trapezoidal rule
      h = (b - a)/n
      sum = (f(a) + f(b))/2

      do i = 1, n - 1
         x = a + i*h
         sum = sum + f(x)
      end do

      result = h*sum

   end subroutine

   subroutine integrate_c(f, a, b, n, result) bind(C)
      ! C-wrapper with reference to bound procedure `fx_c`
      procedure(fx_c) :: f
      real(c_float), intent(in) :: a, b
      integer(c_int), intent(in) :: n
      real(c_float), intent(out) :: result

      call integrate(f, a, b, n, result)

   end subroutine

end module fmodule
