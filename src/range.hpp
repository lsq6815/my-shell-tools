#ifndef RANGE_HPP
#define RANGE_HPP

#include <algorithm>
#include <numeric>

namespace R {
using namespace std;

template <typename C>
void sort(C &c) {
    sort(begin(c), end(c));
}

template <typename C>
void reverse(C &c) {
    reverse(begin(c), end(c));
}

template <typename C, typename OutIter>
void copy(C &c, OutIter out_iter) {
    copy(begin(c), end(c), out_iter);
}
}  // namespace R
#endif
