#ifndef CMODULE_H
#define CMODULE_H

double euclidean_distance(const double point1[3], const double point2[3]);

void add_vectors(int length, const int vec1[], const int vec2[], int result[]);

int *add_vectors_and_return(int length, const int vec1[], const int vec2[]);

#endif // CMODULE_H
