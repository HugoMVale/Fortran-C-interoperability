program fprogram
    use, intrinsic :: iso_c_binding, only: c_double, c_int, c_ptr, c_funptr, c_funloc
    implicit none

    interface
        type(c_ptr) function sample_function(x) bind(C)
            import :: c_double, c_ptr
            implicit none
            real(c_double), value :: x
        end function

        subroutine call_function_with_vector(f, input_vector, output_vector, length) bind(C)
            import :: c_double, c_int, c_funptr
            implicit none
            type(c_funptr), value :: f
            real(c_double), dimension(*), intent(in) :: input_vector
            real(c_double), dimension(*), intent(out) :: output_vector
            integer(c_int), value :: length
        end subroutine
    end interface

    real(c_double), dimension(3) :: input_vector = [1.0, 2.0, 3.0]
    real(c_double), dimension(3) :: output_vector
    integer(c_int) :: length

    length = size(input_vector)

    call call_function_with_vector(c_funloc(sample_function), input_vector, output_vector, length)

    print *, "Output Vector:"
    print *, output_vector

end program fprogram
