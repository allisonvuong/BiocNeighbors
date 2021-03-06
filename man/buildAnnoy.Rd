% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/buildAnnoy.R
\name{buildAnnoy}
\alias{buildAnnoy}
\title{Build an Annoy index}
\usage{
buildAnnoy(
  X,
  transposed = FALSE,
  ntrees = 50,
  directory = tempdir(),
  search.mult = ntrees,
  fname = tempfile(tmpdir = directory, fileext = ".idx"),
  distance = c("Euclidean", "Manhattan")
)
}
\arguments{
\item{X}{A numeric matrix where rows correspond to data points and columns correspond to variables (i.e., dimensions).}

\item{transposed}{Logical scalar indicating whether \code{X} is transposed, i.e., rows are variables and columns are data points.}

\item{ntrees}{Integer scalar specifying the number of trees to build in the index.}

\item{directory}{String containing the path to the directory in which to save the index file.}

\item{search.mult}{Numeric scalar specifying the multiplier for the number of points to search.}

\item{fname}{String containing the path to the index file.}

\item{distance}{String specifying the type of distance to use.}
}
\value{
A \linkS4class{AnnoyIndex} object containing:
\itemize{
\item \code{data}, a numeric matrix equivalent to \code{t(X)}.
\item \code{path}, a string containing the path to the index file.
\item \code{search.mult}, a numeric scalar specifying the number of points to search in downstream functions.
\item \code{NAMES}, a character vector or \code{NULL} equal to \code{rownames(X)}.
\item \code{distance}, a string specifying the distance metric used.
}
}
\description{
Build an Annoy index and save it to file in preparation for a nearest-neighbors search.
}
\details{
This function is automatically called by \code{\link{findAnnoy}} and related functions.
However, it can be called directly by the user to save time if multiple queries are to be performed to the same \code{X}.

It is advisable to change \code{directory} to a location that is amenable to parallel read operations on HPC file systems.
Of course, if index files are manually constructed, the user is also responsible for their clean-up after all calculations are completed.

The \code{ntrees} parameter controls the trade-off between accuracy and computational work.
More trees provide greater accuracy at the cost of more computational work (both in terms of the indexing time and search speed in downstream functions).

The \code{search.mult} controls the parameter known as \code{search_k} in the original Annoy documentation.
Specifically, \code{search_k} is defined as \code{k * search.mult} where \code{k} is the number of nearest neighbors to identify in downstream functions.
This represents the number of points to search exhaustively and determines the run-time balance between speed and accuracy.
The default \code{search.mult=ntrees} represents the Annoy library defaults.

Technically, the index construction algorithm is stochastic but, for various logistical reasons, the seed is hard-coded into the C++ code.
This means that the results of the Annoy neighbor searches will be fully deterministic for the same inputs, even though the theory provides no such guarantees.
}
\examples{
Y <- matrix(rnorm(100000), ncol=20)
out <- buildAnnoy(Y)
out

}
\seealso{
See \code{\link{AnnoyIndex}} for details on the output class.
See \code{\link{findAnnoy}}, \code{\link{queryAnnoy}} and \code{\link{findNeighbors}} for dependent functions.
}
\author{
Aaron Lun
}
