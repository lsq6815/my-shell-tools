#ifndef UTILS_HPP
#define UTILS_HPP
/*
 * Define the commonly used utilities
 */

#include <cstdlib>
#include <iostream>
#include <string>

/**
 * @brief print error message and exit program
 *
 * @param msg error message to be print
 */
inline void error(std::string msg) {
    std::cerr << msg << '\n';
    exit(EXIT_FAILURE);
}

/**
 * @brief readline from input stream
 *
 * @param is input stream, by default is std::cin
 * @param delim delimiter, by default is  '\n'
 */
inline std::string readline(std::istream &is = std::cin, char delim = '\n') {
    std::string line;
    if (std::getline(is, line))
        return line;
    return "";
}

/**
 * @brief read input from stdin with hint message
 *
 * @param msg hint message
 */
inline std::string input(std::string msg) {
    std::cout << msg << ' ';
    return readline();
}

#endif
