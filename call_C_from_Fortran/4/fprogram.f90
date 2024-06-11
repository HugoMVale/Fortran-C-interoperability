program fprogram
  use, intrinsic :: iso_c_binding, only: c_char, c_null_char
  implicit none

  interface
      subroutine to_uppercase(str) bind(C)
          import :: c_char
          character(c_char), dimension(*), intent(inout) :: str
      end subroutine
  end interface

  character(len=:), allocatable :: str

  ! Initialize the string
  str = 'Hello from Fortran!' // c_null_char

  ! Call the C function
  print *, 'Original : ', str
  call to_uppercase(str)
  print *, 'Uppercase: ', str

end program fprogram
