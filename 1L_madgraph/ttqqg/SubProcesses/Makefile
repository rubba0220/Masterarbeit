LIBDIR=../../lib
INCDIR=../../src
MODELLIB=model_sm
CXXFLAGS= -Ofast -I$(INCDIR) -I.
LIBFLAGS= -L$(LIBDIR) -l$(MODELLIB)
CXX=g++
main=ttqqg

all: $(main)

objects=CPPProcess.o ttqqg.o

$(main): $(objects) $(LIBDIR)/lib$(MODELLIB).a
	$(CXX) -o $@ $(objects) $(LIBFLAGS)

$(LIBDIR)/lib$(MODELLIB).a:
	cd ../../src
	make

.PHONY: clean

clean:
	rm -f $(target)
	rm -f $(objects)

