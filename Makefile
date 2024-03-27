# ----- Make Macros -----

CC = g++ -fopenmp 

LD_FLAGS = -I/usr/local/include/python3.11
TARGETS = test
OBJECTS = test.cpp
PYTHON = 3.11
# ----- Make Rules -----

all:	$(TARGETS)

%.o : %.cpp
	${CC} -I/usr/local/include/python3.11 $< -c -o $@

test: $(OBJECTS)
	${CC} -O3 -Wall -shared -std=c++11 -fPIC $$(python3 -m pybind11 --includes) $(OBJECTS) $(LD_FLAGS) -o test.so

clean:
	rm -f $(TARGETS) *.o *.bin core *.html *.xml *.so
