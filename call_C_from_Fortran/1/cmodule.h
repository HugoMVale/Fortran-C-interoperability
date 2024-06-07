#ifndef CMODULE_H
#define CMODULE_H

// Function to compute power with parameters passed by value
double power_by_value(double base, int exponent);

// Function to compute power with parameters passed by reference
void power_by_reference(double *base, int *exponent, double *result);

#endif // CMODULE_H
