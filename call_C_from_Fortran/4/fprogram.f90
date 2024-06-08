program fprogram
    use iso_c_binding, only: c_int, c_float, c_double, c_bool, c_char, c_null_char
    implicit none
    
    integer, parameter :: ARRAY_SIZE = 10, STRING_SIZE = 20
    character(kind=c_char, len=20) ::string_component

    ! Define the struct in Fortran to match the C struct
    type, bind(C) :: thing
        integer(c_int) :: int_component
        real(c_float) :: float_component
        real(c_double) :: array_component(ARRAY_SIZE)
        logical(c_bool) :: bool_component
        character(c_char) :: char_component
        character(kind=c_char) :: string_component(STRING_SIZE)
    end type

    ! Import the C functions
    interface
        function process_thing(t) bind(C) result(new_t)
            import :: thing
            type(thing), intent(in) :: t
            type(thing) :: new_t
        end function
    end interface

    ! Variables
    type(thing) :: my_thing, processed_thing

    ! Initialize and test process_thing
    my_thing%int_component = 42
    my_thing%float_component = 3.14
    my_thing%array_component = [1d0, 2d0, 3d0, 4d0, 5d0, 6d0, 7d0, 8d0, 9d0, 10d0]
    my_thing%bool_component = .true.
    my_thing%char_component = 'a'
    my_thing%string_component(:14) = ['H', 'e', 'l', 'l', 'o', ',', ' ', 'W', 'o', 'r', 'l', 'd', '!', c_null_char]

    print * , my_thing%string_component

    processed_thing = process_thing(my_thing)

    ! Print the original thing
    print *, "Original struct thing:"
    print *, "int_component: ", my_thing%int_component
    print *, "float_component: ", my_thing%float_component
    print *, "array_component: ", my_thing%array_component
    print *, "bool_component: ", my_thing%bool_component
    print *, "char_component: ", my_thing%char_component
    print *, "string_component: ", adjustl(my_thing%string_component)

    ! Print the processed thing
    print *, "Processed struct thing:"
    print *, "int_component: ", processed_thing%int_component
    print *, "float_component: ", processed_thing%float_component
    print *, "array_component: ", processed_thing%array_component
    print *, "bool_component: ", processed_thing%bool_component
    print *, "char_component: ", processed_thing%char_component
    print *, "string_component: ", adjustl(processed_thing%string_component)

end program fprogram
