\name{geom_rect}
\alias{geom_rect}
\alias{GeomRect}
\title{geom\_rect}
\description{2d rectangles}
\details{
This page describes geom\_rect, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom\_rect.  Aesthetics are mapped to variables in the data with the aes function: \code{geom\_rect(aes(x = var))}
\itemize{
  \item \code{xmin}: left (hortizontal minimum) (\strong{required}) 
  \item \code{xmax}: right (hortizontal maximum) (\strong{required}) 
  \item \code{ymin}: bottom (vertical minimum) (\strong{required}) 
  \item \code{ymax}: top (vertical maximum) (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{fill}: internal colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
  \item \code{alpha}: transparency 
}
}
\usage{geom_rect(mapping = NULL, data = NULL, stat = "identity", position = "identity", 
    ...)}
\arguments{
 \item{mapping}{mapping between variables and aesthetics generated by aes}
 \item{data}{dataset used in this layer, if not specified uses plot dataset}
 \item{stat}{statistic used by this layer}
 \item{position}{position adjustment used by this layer}
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot2/geom_rect.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
df <- data.frame(
  x = sample(10, 20, replace = TRUE),
  y = sample(10, 20, replace = TRUE)
)
ggplot(df, aes(xmin = x, xmax = x + 1, ymin = y, ymax = y + 2)) +
geom_rect()
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
