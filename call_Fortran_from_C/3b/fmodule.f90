module fmodule
   use, intrinsic :: iso_c_binding, only: c_int, c_char, c_ptr, c_f_pointer
   implicit none
   private

   public :: open_file

   interface
      integer(c_int) function strlen(string) bind(C)
         import :: c_int, c_ptr
         type(c_ptr), intent(in) :: string ! value?
      end function
   end interface


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


   subroutine open_file_c(unit, filename_cptr) bind(C)
      integer(c_int), intent(in), value :: unit
      type(c_ptr) :: filename_cptr

      integer :: i
      integer :: length
      character(kind=c_char), pointer :: filename_fptr(:)
      character(len=:), allocatable :: filename
      
      length = strlen(filename_cptr)
      print *, "length=", length

      allocate(filename_fptr(length))
      print *, "allocated(filename_fptr)=", associated(filename_fptr)

      call c_f_pointer(cptr=filename_cptr, fptr=filename_fptr, shape=[length])

      print *, "filename_fptr=", associated(filename_fptr), filename_fptr

      ! Convert character array to character string _scalar_
      allocate(character(len=length) :: filename)
      do i = 1, length
         filename(i:i) = filename_fptr(i)
      end do

      call open_file(unit, filename)

   end subroutine

end module fmodule
