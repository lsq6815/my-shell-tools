/* I/O library */
#include <fstream>
#include <iomanip>  // format manipulation
#include <ios>
#include <iostream>
#include <sstream>
/* Algorithms and numerics related */
#include <algorithm>
#include <numeric>
#include <random>
/* Language support library */
#include <initializer_list>
#include <type_traits>
/* General utilities library */
#include <charconv>
#include <chrono>
#include <memory>  // Supply std::shared/weak/unique ptr
#include <tuple>
#include <utility>  // Supply std::pair
/* Containers and iterators library */
#include <array>  // STL style array
#include <iterator>
#include <map>
#include <queue>   // Supply std::priority_queue and std::deque
#include <vector>  // Useful array list
/* Concurrency related */
#include <atomic>
#include <condition_variable>
#include <mutex>
#include <thread>
/* Misc */
#include <regex>
#include <string>
/* File System Support */
#include <filesystem>
namespace fs = std::filesystem;

#include "utils.hpp"

int main(int argc, char **argv) {
    Lines a = {"Hello", "World"};
    std::cout << '[' << a << ']' << '\n';
}
