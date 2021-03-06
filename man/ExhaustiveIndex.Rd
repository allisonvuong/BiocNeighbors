% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Exhaustive-class.R
\name{ExhaustiveIndex}
\alias{ExhaustiveIndex}
\alias{ExhaustiveIndex-class}
\alias{bnorder,ExhaustiveIndex-method}
\title{The ExhaustiveIndex class}
\usage{
ExhaustiveIndex(data, NAMES = NULL, distance = "Euclidean")

\S4method{bnorder}{ExhaustiveIndex}(x)
}
\arguments{
\item{data}{A numeric matrix with data points in columns and dimensions in rows.}

\item{NAMES}{A character vector of sample names or \code{NULL}.}

\item{distance}{A string specifying the distance metric to use.
Defaults to \code{"Euclidean"}.}
}
\value{
An ExhaustiveIndex object.
}
\description{
A class to hold the data for exact nearest neighbor identification.
}
\details{
Users should never need to call the constructor explicitly, but should generate 
instances of ExhaustiveIndex classes with \code{\link{buildExhaustive}}.
}
\examples{
example(buildExhaustive)

}
