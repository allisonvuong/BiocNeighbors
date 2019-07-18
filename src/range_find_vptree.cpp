#include "vptree.h"
#include "distances.h"
#include "range_find_exact.h"

// [[Rcpp::export(rng=false)]]
Rcpp::RObject range_find_vptree(Rcpp::IntegerVector to_check, Rcpp::NumericMatrix X, Rcpp::List nodes, 
    std::string dtype, Rcpp::NumericVector dist_thresh, bool get_index, bool get_distance) 
{
    if (dtype=="Manhattan") {
        VpTree<BNManhattan> n_finder(X, nodes);
        return range_neighbors(n_finder, to_check, dist_thresh, get_index, get_distance);
     } else {
        VpTree<BNEuclidean> n_finder(X, nodes);
        return range_neighbors(n_finder, to_check, dist_thresh, get_index, get_distance);
    }
}
