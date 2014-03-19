\name{rle2}
\alias{rle2}
\title{
Run length encoding (alternate implementation)
}
\description{
Summarize vector of numeric or character values containing runs of repeated values. This function is very similar to the base function rle, but sometimes much faster, and different in that it has an option to return the start/end indices for each run.
}
\usage{
rle2(x, indices = FALSE, return.list = FALSE)
}
\arguments{
  \item{x}{
Input vector containing either numeric or character data.
}
  \item{indices}{
If FALSE, function records value and length for each run; if TRUE, function records value, start position, stop position, and length for each run.
}
  \item{return.list}{
If FALSE, function returns 2- or 4-column matrix if x is a numeric vector and 2- or 4- column data frame if x is a character vector (number of columns depends on value for indices); if TRUE, function returns 2- or 4-element list, similar to the object returned by the base R function rle.
}
}
\details{
NA
}
\value{
Depending on the inputs indices and return.list, a matrix or data frame with 2 or 4 columns, or a list of either 2 or 4 vectors.
}
\references{
Acknowledgment: This material is based upon work supported by the National Science Foundation Graduate Research Fellowship under Grant No. DGE-0940903.
}
\author{
Dane R. Van Domelen
}
\note{
For numeric data, rle2 runs 2-10 times faster than rle. In general, the longer the input vector and the longer the runs, the greater the speed advantage of rle2 over rle. 

For character data, rle2 is often slower than rle, sometimes by an order of magnitude or more. However, for very long vectors (e.g. length > 10,000) with long runs (e.g. average run length > 100), rle2 can be up to 5 times faster than rle.

Some additional information on the package accelerometry and its functions can be found on the author's website, \url{https://sites.google.com/site/danevandomelen/}
}
\seealso{
\code{\link{inverse.rle2}}, \code{\link{rle}}, \code{\link{inverse.rle}}
}
\examples{
# Load in sample data frame
data(unidata)

# Get long vector of ID numbers
id.numbers <- unidata[,1]

# Summarize runs of ID numbers
id.summarized <- rle2(x = id.numbers, indices = TRUE)
}
\keyword{ accelerometry }
\keyword{ rle }
\keyword{ consecutive }