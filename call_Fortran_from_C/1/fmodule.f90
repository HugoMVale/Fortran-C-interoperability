module fmodule
   use, intrinsic :: iso_c_binding, only: c_int, c_float, c_double, c_double_complex, c_char, c_bool
   implicit none
   private

   public :: print_args

contains

   integer function print_args(i, f, d, cd, c, b)
      integer, intent(in) :: i
      real, intent(in) :: f
      double precision, intent(in) :: d
      double complex, intent(in) :: cd
      character, intent(in) :: c
      logical, intent(in) :: b

      print *, "Integer value: ", i
      print *, "Float32 value: ", f
      print *, "Float64 value: ", d
      print *, "Complex64 value: ", cd
      print *, "Character value: ", c
      print *, "Boolean value: ", b

      print_args = 0

   end function

   integer(c_int) function print_args_c(i, f, d, cd, c, b) bind(C)
      ! C-wrapper for print_args
      ! Some arguments are passed by value, others by reference (just to show how it works)
      integer(c_int), intent(in) :: i
      real(c_float), intent(in), value :: f
      real(c_double), intent(in), value :: d
      complex(c_double_complex), intent(in) :: cd
      character(c_char), intent(in), value :: c
      logical(c_bool), intent(in), value :: b

      ! Change of logical kind required to match Fortran type
      print_args_c = print_args(i, f, d, cd, c, logical(b, kind=4))

   end function

end module fmodule
