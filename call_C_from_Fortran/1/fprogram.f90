program fprogram
    use iso_c_binding, only: c_int, c_double
    use, intrinsic :: iso_fortran_env, only : dp=>real64
    implicit none

    ! Import the C functions
    interface
        function power_by_value(base, exponent) bind(C, name="power_by_value") result(res)
            use iso_c_binding
            real(c_double), value :: base
            integer(c_int), value :: exponent
            real(c_double) :: res
        end function power_by_value

        subroutine power_by_reference(base, exponent, result) bind(C, name="power_by_reference")
            use iso_c_binding
            real(c_double) :: base
            integer(c_int) :: exponent
            real(c_double) :: result
        end subroutine power_by_reference
    end interface

    ! Variables
    real(dp) :: base, result
    integer :: exponent

    ! Test power_by_value
    base = 2.0
    exponent = 3
    result = power_by_value(base, exponent)
    print *, "power_by_value: ", base, "**", exponent, " = ", result

    ! Test power_by_reference
    base = 3.0
    exponent = 4
    call power_by_reference(base, exponent, result)
    print *, "power_by_reference: ", base, "**", exponent, " = ", result
    
end program fprogram
    