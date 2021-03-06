% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Hnsw-class.R
\name{HnswIndex}
\alias{HnswIndex}
\alias{HnswIndex_path}
\alias{HnswIndex_ef_search}
\alias{bnorder,HnswIndex-method}
\alias{HnswIndex-method}
\alias{show,HnswIndex-method}
\title{The HnswIndex class}
\usage{
HnswIndex(data, path, ef.search = 10, NAMES = NULL, distance = "Euclidean")

HnswIndex_path(x)

HnswIndex_ef_search(x)

\S4method{bnorder}{HnswIndex}(x)

\S4method{show}{HnswIndex}(object)
}
\arguments{
\item{data}{A numeric matrix with data points in columns and dimensions in rows.}

\item{path}{A string specifying the path to the index file.}

\item{ef.search}{Integer scalar specifying the size of the dynamic list at run time.}

\item{NAMES}{A character vector of sample names or \code{NULL}.}

\item{distance}{A string specifying the distance metric to use.}
}
\value{
An HnswIndex object.
}
\description{
A class to hold indexing structures for the HNSW algorithm for approximate nearest neighbor identification.
}
\details{
The HnswIndex class holds the indexing structure required to run the HNSW algorithm.
Users should never need to call the constructor explicitly, but should generate instances of HnswIndex classes with \code{\link{buildHnsw}}.
}
\examples{
out <- example(buildHnsw)
str(HnswIndex_path(out))
str(HnswIndex_ef_search(out))

}
\seealso{
\code{\link{buildHnsw}}.
}
\author{
Aaron Lun
}
