#include <algorithm>
#include <filesystem>
#include <iostream>
#include <iterator>

#include "range.hpp"
#include "utils.hpp"
namespace fs = std::filesystem;

int main(int argc, char** argv) {
    if (argc < 2) {
        Lines lines = readlines();
        R::for_each(lines, [](Line& line) {
            line = fs::path{line}.extension().string();
        });
        print(lines);
        return 0;
    }
}
