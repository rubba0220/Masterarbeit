
# Build diags from diags.cpp against DiaGenIdSolver libs (Kyoto backend)

# Where DiaGenIdSolver was built:
DIAGEN_ROOT := /net/home/lxtsfs1/tpe/bartel/local/src/DiaGenIdSolver

CXX      := c++
CXXFLAGS := -std=c++11 -O -DLARGE_DATABASES -DKYOTODB
# add Kyoto include dir if needed:
CPPFLAGS := -I$(DIAGEN_ROOT)/Utilities -I$(DIAGEN_ROOT)/DiaGen -I$(DIAGEN_ROOT)/IdSolver \
            -I/net/home/lxtsfs1/tpe/bartel/.local/include/kyotocabinet \
            -I/net/home/lxtsfs1/tpe/bartel/.local/include

LDFLAGS  := -L$(DIAGEN_ROOT)/Utilities -L$(DIAGEN_ROOT)/DiaGen -L$(DIAGEN_ROOT)/IdSolver \
            -L/net/home/lxtsfs1/tpe/bartel/.local/lib \
            -Wl,-rpath,$(DIAGEN_ROOT)/Utilities -Wl,-rpath,$(DIAGEN_ROOT)/DiaGen -Wl,-rpath,$(DIAGEN_ROOT)/IdSolver \
            -Wl,-rpath,/net/home/lxtsfs1/tpe/bartel/.local/lib
LIBS     := -lIdSolver -lDiaGen -lUtilities -lkyotocabinet -lpthread

# ensure libs exist (build them once in the project tree)
.PHONY: checklibs
checklibs:
	@test -f "$(DIAGEN_ROOT)/Utilities/libUtilities.a" || { echo "Missing libUtilities.a; run 'make' in $(DIAGEN_ROOT)"; exit 1; }
	@test -f "$(DIAGEN_ROOT)/DiaGen/libDiaGen.a"       || { echo "Missing libDiaGen.a; run 'make' in $(DIAGEN_ROOT)"; exit 1; }
	@test -f "$(DIAGEN_ROOT)/IdSolver/libIdSolver.a"   || { echo "Missing libIdSolver.a; run 'make' in $(DIAGEN_ROOT)"; exit 1; }

diags: diags.cpp checklibs
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $< -o $@ $(LDFLAGS) $(LIBS)

clean:
	rm -f diags