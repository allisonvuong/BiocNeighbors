% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/queryKNN-functions.R, R/queryKNN-methods.R
\docType{methods}
\name{queryKNN}
\alias{queryKNN}
\alias{queryKNN,missing,missing-method}
\alias{queryKNN,queryKNN-method}
\alias{queryKNN,missing,KmknnParam-method}
\alias{queryKNN,KmknnIndex,missing-method}
\alias{queryKNN,KmknnIndex,KmknnParam-method}
\alias{queryKNN,missing,VptreeParam-method}
\alias{queryKNN,VptreeIndex,missing-method}
\alias{queryKNN,VptreeIndex,VptreeParam-method}
\alias{queryKNN,missing,AnnoyParam-method}
\alias{queryKNN,AnnoyIndex,missing-method}
\alias{queryKNN,AnnoyIndex,AnnoyParam-method}
\alias{queryKNN,missing,HnswParam-method}
\alias{queryKNN,HnswIndex,missing-method}
\alias{queryKNN,HnswIndex,HnswParam-method}
\alias{queryKNN,missing,ExhaustiveParam-method}
\alias{queryKNN,ExhaustiveIndex,missing-method}
\alias{queryKNN,ExhaustiveIndex,ExhaustiveParam-method}
\title{Query k-nearest neighbors}
\usage{
\S4method{queryKNN}{missing,missing}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{missing,KmknnParam}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{KmknnIndex,missing}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{KmknnIndex,KmknnParam}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{missing,VptreeParam}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{VptreeIndex,missing}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{VptreeIndex,VptreeParam}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{missing,AnnoyParam}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{AnnoyIndex,missing}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{AnnoyIndex,AnnoyParam}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{missing,HnswParam}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{HnswIndex,missing}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{HnswIndex,HnswParam}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{missing,ExhaustiveParam}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{ExhaustiveIndex,missing}(X, query, k, ..., BNINDEX, BNPARAM)

\S4method{queryKNN}{ExhaustiveIndex,ExhaustiveParam}(X, query, k, ..., BNINDEX, BNPARAM)
}
\arguments{
\item{X}{A numeric data matrix where rows are points and columns are dimensions.
This can be missing if \code{BNINDEX} is supplied.}

\item{query}{A numeric matrix of query points, containing different data points in the rows but the same number and ordering of dimensions in the columns.}

\item{k}{A positive integer scalar specifying the number of nearest neighbors.}

\item{...}{Further arguments to pass to individual methods.
This is guaranteed to include \code{subset}, \code{get.index}, \code{get.distance}, \code{last},
\code{transposed}, \code{warn.ties}, \code{raw.index} and \code{BPPARAM}.
See \code{?"\link{queryKNN-methods}"} for more details.}

\item{BNINDEX}{A \linkS4class{BiocNeighborIndex} object containing precomputed index information.
This can be missing if \code{BNPARAM} is supplied, see Details.}

\item{BNPARAM}{A \linkS4class{BiocNeighborParam} object specifying the algorithm to use.
This can be missing if \code{BNINDEX} is supplied, see Details.}
}
\value{
List containing:
\code{index}, an integer matrix of neighbor identities;
and \code{distance}, a numeric matrix of distances to those neighbors.
See \code{?"\link{queryKNN-methods}"} for more details.
}
\description{
Find the k-nearest neighbors in one data set for each point in another query data set, using exact or approximate algorithms.
}
\details{
The class of \code{BNINDEX} and \code{BNPARAM} will determine dispatch to specific methods.
Only one of these arguments needs to be defined to resolve dispatch.
However, if both are defined, they cannot specify different algorithms.

If \code{BNINDEX} is supplied, \code{X} does not need to be specified.
In fact, any value of \code{X} will be ignored as all necessary information for the search is already present in \code{BNINDEX}.
Similarly, any parameters in \code{BNPARAM} will be ignored.

If both \code{BNINDEX} and \code{BNPARAM} are missing, the function will default to the KMKNN algorithm by setting \code{BNPARAM=KmknnParam()}.
}
\examples{
Y <- matrix(rnorm(100000), ncol=20)
Z <- matrix(rnorm(10000), ncol=20)

str(k.out <- queryKNN(Y, Z, k=10))
str(a.out <- queryKNN(Y, Z, k=10, BNPARAM=AnnoyParam()))

e.dex <- buildExhaustive(Y)
str(e.out2 <- queryKNN(Y, Z, k=10, BNINDEX=e.dex))
str(e.out3 <- queryKNN(Y, Z, k=10, BNINDEX=e.dex, BNPARAM=ExhaustiveParam()))

k.dex <- buildKmknn(Y)
str(k.out2 <- queryKNN(Y, Z, k=10, BNINDEX=k.dex))
str(k.out3 <- queryKNN(Y, Z, k=10, BNINDEX=k.dex, BNPARAM=KmknnParam()))

a.dex <- buildAnnoy(Y)
str(a.out2 <- queryKNN(Y, Z, k=10, BNINDEX=a.dex))
str(a.out3 <- queryKNN(Y, Z, k=10, BNINDEX=a.dex, BNPARAM=AnnoyParam()))

}
\seealso{
\code{\link{queryExhaustive}},
\code{\link{queryKmknn}},
\code{\link{queryVptree}},
\code{\link{queryAnnoy}}
and \code{\link{queryHnsw}} for specific methods.
}
\author{
Aaron Lun
}
