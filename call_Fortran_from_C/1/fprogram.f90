program fprogram
   use fmodule
   implicit none

   integer :: i
   real :: f
   double precision :: d
   double complex :: cd
   character :: c
   logical :: b
   integer :: ret

   ! Initialize variables
   i = 42
   f = 2*asin(1.0)
   d = exp(1d0)
   cd = (1d0, -1d0)
   c = 'A'
   b = .true.

   ! Call the function and store the return value
   ret = print_args(i, f, d, cd, c, b)
   print *, "Return value: ", ret

end program fprogram
