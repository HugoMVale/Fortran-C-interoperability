// cmodule.h

#ifndef CMODULE_H
#define CMODULE_H

#ifdef __cplusplus
extern "C"
{
#endif

    // Declaration of the add function for integers
    int add_ints(int a, int b);

    // Declaration of the add function for doubles
    double add_doubles(double a, double b);

#ifdef __cplusplus
}
#endif

#endif // CMODULE_H
