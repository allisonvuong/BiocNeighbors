% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Exhaustive-class.R
\name{ExhaustiveParam}
\alias{ExhaustiveParam}
\alias{ExhaustiveParam-class}
\title{The ExhaustiveParam class}
\usage{
ExhaustiveParam(distance = "Euclidean")
}
\arguments{
\item{distance}{A string specifying the distance metric to use.}
}
\value{
The \code{ExhaustiveParam} constructor will return an instance of the ExhaustiveParam class.
}
\description{
A class to hold parameters for the exhaustive algorithm for exact nearest neighbor identification.
}
\examples{
out <- ExhaustiveParam()

}
\seealso{
\code{\link{buildExhaustive}}
}
\author{
Allison Vuong
}
