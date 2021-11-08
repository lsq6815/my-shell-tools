#include <algorithm>
#include <chrono>
#include <filesystem>
#include <fstream>
#include <functional>
#include <iostream>
#include <iterator>
#include <list>
#include <numeric>
#include <sstream>
#include <string>
#include <vector>  // Useful array list

#include "utils.hpp"

namespace fs = std::filesystem;

/**
 * @brief read from stream line by line, and reverse the lines, output to
 * out_iter
 *
 * @tparam OutIter type for output iterator
 * @param is input stream
 * @param out_iter output iterator
 */
template <typename OutIter>
inline void reverse_from_stream(std::istream& is, OutIter out_iter) {
    std::string line;
    std::list<std::string> res;
    while (std::getline(is, line)) {
        res.push_front(std::move(line));
    }
    copy(res.begin(), res.end(), out_iter);
}

auto normal_out_iter = std::ostream_iterator<std::string>(std::cout, "\n");

int main(int argc, char** argv) {
    // if no file (via parameter) inputed, deal with stdin
    if (argc < 2) reverse_from_stream(std::cin, normal_out_iter);

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
        reverse_from_stream(i, normal_out_iter);
    }
}
