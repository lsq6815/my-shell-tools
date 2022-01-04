#include <filesystem>
#include <fstream>

#include "range.hpp"
#include "utils.hpp"

namespace fs = std::filesystem;

int main(int argc, char** argv) {
    // if no file (via parameter) inputed, deal with stdin
    if (argc < 2) {
        auto lines = readlines();
        R::reverse(lines);
        print(lines);
    }

    // verify if file exist
    std::vector<fs::path> files;
    for (int i = 1; i < argc; i++) {
        if (fs::path f{argv[i]}; fs::exists(f))
            files.push_back(std::move(f));
        else
            error("[reverse] file: '" + f.string() + "' isn't exists!");
    }

    // verify if file opened
    std::vector<std::ifstream> ifss;
    for (auto& f : files) {
        if (std::ifstream ifs{f})
            ifss.push_back(std::move(ifs));
        else
            error("[reverse] file: '" + f.string() + "' can't be open!");
    }

    // reverse files
    for (auto& i : ifss) {
        auto lines = readlines(i);
        R::reverse(lines);
        print(lines);
    }
}
