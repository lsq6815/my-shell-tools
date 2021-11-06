# Every C++ program should be single-file.
CC := g++
# Yes we need c++17
CFLAGS := -std=c++17

# Keep all *.cpp file in 'src' directory
SRC := $(wildcard ./src/*.cpp)
# Change the prefix from 'src' to 'bin'
BIN := $(subst ./src/,./bin/,$(SRC))
# remove the extension
BIN := $(patsubst %.cpp,%,$(BIN))

all: $(BIN)

# Pattern match
$(BIN): $(SRC)
	$(CC) $(CFLAGS) $< -o $@

clear:
	$(RM) bin/*
