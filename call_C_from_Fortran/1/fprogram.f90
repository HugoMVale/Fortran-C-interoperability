program fprogram
    use iso_c_binding, only: c_int, c_double
    implicit none

    interface
        function add_ints(a, b) bind(C, name="add_ints") result(res)
            import :: c_int
            implicit none
            integer(c_int), value :: a, b
            integer(c_int) :: res
        end function add_ints

        function add_doubles(a, b) bind(C, name="add_doubles") result(res)
            import :: c_double
            implicit none
            real(c_double), value :: a, b
            real(c_double) :: res
        end function add_doubles
    end interface

    ! Variables for the integer addition
    integer(c_int) :: x, y, int_result
    ! Variables for the double addition
    real(c_double) :: a, b, double_result

    ! Assign values to the variables
    x = 5
    y = 10
    a = 5.5
    b = 10.5

    ! Call the C functions
    int_result = add_ints(x, y)
    double_result = add_doubles(a, b)

    ! Print the results
    print *, "The sum of ", x, " and ", y, " is ", int_result
    print *, "The sum of ", a, " and ", b, " is ", double_result

end program fprogram
