program fprogram
   use, intrinsic :: iso_fortran_env, only: real64
   use iso_c_binding, only: c_double, c_int, c_ptr, c_f_pointer
   implicit none

   interface
      real(c_double) function euclidean_distance(point1, point2) bind(C)
         import :: c_double
         real(c_double), dimension(3), intent(in) :: point1, point2
      end function

      subroutine add_vectors(length, vec1, vec2, result) bind(C)
         import :: c_int
         integer(c_int), intent(in), value :: length
         integer(c_int), intent(in) :: vec1(*), vec2(*)
         integer(c_int), intent(out) :: result(*)
      end subroutine

      type(c_ptr) function add_vectors_and_return(length, vec1, vec2) bind(C)
         import :: c_int, c_ptr
         integer(c_int), intent(in), value :: length
         integer(c_int), intent(in) :: vec1(*), vec2(*)
      end function

      subroutine free(ptr) bind(C)
         import :: c_ptr
         type(c_ptr), value :: ptr
      end subroutine
   end interface

   ! Declare arrays and variables
   real(real64) :: point1(3), point2(3), distance
   integer, parameter :: vec_length = 5
   integer, dimension(vec_length) :: vec1, vec2, result_subroutine
   integer, pointer :: result_function(:)
   type(c_ptr) :: c_result_ptr

   ! Call the C function `euclidean_distance`
   point1 = [1d0, 2d0, 3d0]
   point2 = [4d0, 5d0, 6d0]

   distance = euclidean_distance(point1, point2)

   print *, "Euclidean Distance: ", distance

   ! Call the C _void_ function `add_vectors`
   vec1 = [1, 2, 3, 4, 5]
   vec2 = [6, 7, 8, 9, 10]

   call add_vectors(vec_length, vec1, vec2, result_subroutine)

   print *, "Result Vector (add_vectors):"
   print *, result_subroutine

   ! Call the C function `add_vectors_and_return`
   c_result_ptr = add_vectors_and_return(vec_length, vec1, vec2)

   call c_f_pointer(cptr=c_result_ptr, fptr=result_function, shape=[vec_length])

   print *, "Result Vector (add_vectors_and_return):"
   print *, result_function

   ! Free the allocated memory (we need to call a C function to do this)
   call free(c_result_ptr)

end program fprogram
