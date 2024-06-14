module fmodule
   use, intrinsic :: iso_fortran_env, only: real32, real64
   use, intrinsic :: iso_c_binding, only: c_int, c_float, c_double, c_double_complex, c_char, c_bool
   implicit none
   private

   public :: print_args, print_args_c

contains

   integer function print_args(i, f, d, cd, c, b)
      integer, intent(in) :: i
      real(real32), intent(in) :: f
      real(real64), intent(in) :: d
      complex(real64), intent(in) :: cd
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
      integer(c_int), intent(in), value :: i
      real(c_float), intent(in), value :: f
      real(c_double), intent(in), value :: d
      complex(c_double_complex), intent(in), value :: cd
      character(c_char), intent(in), value :: c
      logical(c_bool), intent(in), value :: b

      ! change of logical kind required to match Fortran type
      print_args_c = print_args(i, f, d, cd, c, logical(b, kind=4))

   end function

end module fmodule
