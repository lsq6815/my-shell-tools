# Every C++ program should be single-file.
CC := g++
# Yes we need c++17
CFLAGS := -std=c++17

# Keep all *.cpp file in 'src' directory
SRC := $(wildcard ./src/*.cpp)
# Change the prefix from 'src' to 'bin'
BIN := $(subst ./src/,./bin/,$(SRC))
# Change the extension from 'cpp' to 'out'
BIN := $(patsubst %.cpp,%.out,$(BIN))

all: $(BIN)

# Pattern match
$(BIN): $(SRC)
	$(CC) $(CFLAGS) $< -o $@

clear:
	$(RM) bin/*
