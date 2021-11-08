# Use the C++17 standard
CXXFLAGS += -std=c++17

# Match all cpp file under src/
SRC = $(wildcard src/*.cpp)
BIN = $(patsubst src/%.cpp,bin/%,$(SRC))

all: $(BIN)
	@echo "Compilation finished"

bin/%: src/%.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	$(RM) bin/*

.PHONY: all clean
