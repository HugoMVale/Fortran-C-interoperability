program fprogram
   use fmodule, only: integrate
   implicit none

   ! Local variables
   real :: a, b, result
   integer :: n

   ! Set integration limits
   a = 0.0
   b = 2*asin(1.0)

   ! Set the number of subintervals
   n = 1000

   ! Call the integration subroutine
   call integrate(my_function, a, b, n, result)

   ! Print the result
   print *, "The integral of sin(x) from 0 to pi is approximately: ", result

contains

   ! Function to be integrated
   real function my_function(x)
      real, intent(in) :: x
      my_function = sin(x)
   end function

end program fprogram
