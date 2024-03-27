#include <cstdio>
#include "pybind11/include/pybind11/pybind11.h"

void function(long ptr) {
  void *ptr_cast = (void*)ptr;
  printf("pointer %p\n", ptr_cast);
}

PYBIND11_MODULE(test, m) {
    m.def("function", &function, "a function that prints the pointer");
}
