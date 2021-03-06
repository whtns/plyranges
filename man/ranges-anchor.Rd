% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ranges-anchors.R
\name{anchor}
\alias{anchor}
\alias{unanchor}
\alias{anchor_start}
\alias{anchor_end}
\alias{anchor_center}
\alias{anchor_centre}
\alias{anchor_3p}
\alias{anchor_5p}
\title{Anchored Ranges objects}
\usage{
anchor(x)

unanchor(x)

anchor_start(x)

anchor_end(x)

anchor_center(x)

anchor_centre(x)

anchor_3p(x)

anchor_5p(x)
}
\arguments{
\item{x}{a Ranges object}
}
\value{
a RangesAnchored object which has the same appearance as a regular
Ranges object but with an additional slot displaying an anchor.
}
\description{
The \code{GRangesAnchored} class and the \code{IRangesAnchored}
class allow components of a \code{GRanges} or \code{IRanges} (start, end, center)
to be held fixed.
}
\details{
Anchoring will fix a Ranges start, end, or center positions,
so these positions will remain the same when performing arithimetic.
For \code{GRanges} objects, the function
(\code{anchor_3p()}) will fix the start for the negative strand,
while \code{anchor_5p()} will fix the end for the
positive strand. Anchoring modifies how arithmetic is performed, for example
modifying the width of a range with \code{set_width()} or stretching a
range with \code{stretch()}. To remove anchoring use \code{unanchor()}.
}
\section{Constructors}{

Depending on how you want to fix the components of a Ranges, there are
five ways to construct a RangesAnchored class. Here \code{x} is either
an \code{IRanges} or \code{GRanges} object.
\itemize{
\item{\code{anchor_start(x)}}{Fix the start coordinates}
\item{\code{anchor_end(x)}}{Fix the end coordinates}
\item{\code{anchor_center(x)}}{Fix the center coordinates}
\item{\code{anchor_3p(x)}}{On the negative strand fix the start coordinates,
and for positive or unstranded ranges fix the end coordinates.}
\item{\code{anchor_5p(x)}}{On the positive or unstranded ranges fix the start coordinates,
coordinates and for negative stranded ranges fix the end coordinates.}
}
}

\section{Accessors}{

To see what has been anchored use the function \code{anchor}.
This will return a character vector containing a valid anchor.
It will be set to one of \code{c("start", "end", "center")} for an
\code{IRanges} object or one of
\code{c("start", "end", "center", "3p", "5p")} for a \code{GRanges} object.
}

\examples{
df <- data.frame(start = 1:10, width = 5)
rng <- as_iranges(df)
rng_by_start <- anchor_start(rng)
rng_by_start
anchor(rng_by_start)
mutate(rng_by_start, width = 3L)
grng <- as_granges(df,
                   seqnames = "chr1",
                   strand = c(rep("-", 5), rep("+", 5)))
rng_by_5p <- anchor_5p(grng)
rng_by_5p
mutate(rng_by_5p, width = 3L)

}
\seealso{
\link{mutate}, \link{stretch}
}
