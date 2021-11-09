#ifndef RANGE_HPP
#define RANGE_HPP

#include <algorithm>
#include <numeric>

/**
 * for range-based STL algorithm
 */
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

template <typename C, typename UnaryOp>
void for_each(C &c, UnaryOp unary_op) {
    for_each(begin(c), end(c), unary_op);
}

template <typename C, typename OutIter, typename UnaryOp>
void transform(C &c, OutIter out_iter, UnaryOp unary_op) {
    transform(begin(c), end(c), out_iter, unary_op);
}

}  // namespace R
#endif
