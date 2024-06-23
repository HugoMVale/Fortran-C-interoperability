module fmodule
   implicit none
   private

   public :: open_file

contains

   subroutine open_file(unit, filename)
      integer, intent(in) :: unit
      character(len=*), intent(in) :: filename

      print *, "filename=", filename
      print *, "length  =", len(filename)
      print *, "unit    =", unit

      open (unit=unit, file=filename)
      close (unit)

   end subroutine

   subroutine open_file_c(unit, filename, length) bind(C)
      use, intrinsic :: iso_c_binding, only: c_int, c_char
      integer(c_int), intent(in), value :: unit
      integer(c_int), intent(in), value :: length
      character(kind=c_char), intent(in) :: filename(length)

      character(len=length) :: filename_
      integer :: i

      ! Convert character array to character string _scalar_
      do i = 1, length
         filename_(i:i) = filename(i)
      end do

      call open_file(unit, filename_)

   end subroutine

end module fmodule
