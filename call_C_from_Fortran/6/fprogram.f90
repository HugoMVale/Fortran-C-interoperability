program fprogram
    use, intrinsic :: iso_fortran_env, only : real64
    use, intrinsic :: iso_c_binding, only: c_double, c_int, c_ptr, c_funptr, c_funloc
    implicit none

    interface
        subroutine apply_function_to_vector(f, input_vector, output_vector, length) bind(C)
            import :: c_double, c_int, c_funptr
            implicit none
            type(c_funptr), value :: f
            real(c_double), dimension(*), intent(in) :: input_vector
            real(c_double), dimension(*), intent(out) :: output_vector
            integer(c_int), value :: length
        end subroutine
    end interface

    integer, parameter :: length = 3        
    real(real64), dimension(length) :: input_vector, output_vector

    input_vector = [1d0, 2d0, 3d0]

    call apply_function_to_vector(c_funloc(square), input_vector, output_vector, length)

    print *, "Output Vector:"
    print *, output_vector

    contains

    real(real64) function square(x) bind(C)
        real(real64), intent(in), value :: x
        square = x**2
    end function    

end program fprogram
