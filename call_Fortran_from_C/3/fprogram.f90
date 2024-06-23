program fprogram
   use fmodule, only: open_file
   implicit none

   character(len=*), parameter :: filename="hello_fortran.txt"

   call open_file(8, filename)

end program fprogram
