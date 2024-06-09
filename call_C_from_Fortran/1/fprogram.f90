program fprogram
    use, intrinsic :: iso_fortran_env, only : real64
    use iso_c_binding, only: c_int, c_float, c_double, c_char, c_bool, c_double_complex
    
    implicit none

    interface
        subroutine print_args(i, ip, f, fp, d, dp, cd, cdp, c, cp, b) bind(C)
            import :: c_int, c_float, c_double, c_char, c_bool, c_double_complex
            implicit none
            integer(c_int), value :: i
            integer(c_int), intent(inout) :: ip
            real(c_float), value :: f
            real(c_float), intent(inout) :: fp
            real(c_double), value :: d
            real(c_double),intent(inout) :: dp
            complex(c_double_complex), value :: cd
            complex(c_double_complex), intent(inout) :: cdp
            character(c_char), value :: c
            character(c_char), intent(inout) :: cp
            logical(c_bool), value :: b
        end subroutine
    end interface

    integer :: i, ip
    real :: f, fp
    real(real64) :: d, dp
    complex(real64) :: cd, cdp
    character :: c, cp
    logical(c_bool) :: b

    ! Initialize the variables
    i = 10
    ip = 20
    f = 3.14
    fp = 6.28
    d = 2.718d0
    dp = 1.618d0
    cd = (1.0d0, 2.0d0)
    cdp = (3.0d0, 4.0d0)
    c = 'A'
    cp = 'Z'
    b = .true.

    ! Call the C function
    call print_args(i, ip, f, fp, d, dp, cd, cdp, c, cp, b)
    
end program fprogram

    