#ifndef UTILS_HPP
#define UTILS_HPP
/*
 * Define the commonly used utilities
 */

#include <algorithm>
#include <cstdlib>
#include <iostream>
#include <iterator>
#include <string>
#include <vector>

#include "range.hpp"

using std::begin;
using std::cerr;
using std::cin;
using std::cout;
using std::end;
using std::next;
using std::prev;

using Line = std::string; ///< a line of input
using Lines = std::vector<Line>; ///< a group of input

/**
 * @brief I/O for Lines
 *
 */
std::ostream &operator<<(std::ostream &os, const Lines &lines) {
    for (auto it = cbegin(lines); it != prev(cend(lines)); it++) {
        cout << *it << '\n';
    }
    // no tailing \n
    cout << *prev(cend(lines));
    return os;
}

/**
 * @brief print error message and exit program
 *
 * @param msg error message to be print
 */
inline void error(Line msg) {
    cerr << msg << '\n';
    exit(EXIT_FAILURE);
}

/**
 * @brief readline from input stream
 *
 * @param is input stream, by default is std::cin
 * @param delim delimiter, by default is newline
 */
inline Line readline(std::istream &is = cin, char delim = '\n') {
    Line line;
    if (std::getline(is, line, delim)) return line;
    return "";
}

/**
 * @brief read lines from inpute stream
 *
 * @param is input stream, by default is std::cin
 * @param delim delimiter, by default is newline
 */
Lines readlines(std::istream &is = cin, char delim = '\n') {
    Lines lines;
    Line line;
    while (std::getline(is, line, delim)) {
        lines.push_back(std::move(line));
    }
    return lines;
}

/**
 * @brief output the input via iterator
 *
 * @tparam OutIter output iterator type
 * @param out_iter output iterator
 * @param is input stream, by default is std::cin
 * @param delim delimiter, by default is newline
 */
template <typename OutIter>
inline void from_input_stream(OutIter out_iter, std::istream &is = cin,
                              char delim = '\n') {
    auto lines = readlines(is, delim);
    R::copy(lines, out_iter);
}

/**
 * @brief read input from stdin with hint message
 *
 * @param msg hint message
 */
inline Line input(Line msg) {
    cout << msg << ' ';
    return readline();
}

#endif
