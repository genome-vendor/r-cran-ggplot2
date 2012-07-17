\name{stat_quantile}
\alias{stat_quantile}
\alias{StatQuantile}
\title{stat\_quantile}
\description{Continuous quantiles}
\details{
This page describes stat\_quantile, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with stat\_quantile.  Aesthetics are mapped to variables in the data with the aes function: \code{stat\_quantile(aes(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
}
}
\usage{stat_quantile(mapping = NULL, data = NULL, geom = "quantile", 
    position = "identity", quantiles = c(0.25, 0.5, 0.75), formula = y ~ 
        x, method = "rq", na.rm = FALSE, ...)}
\arguments{
 \item{mapping}{mapping between variables and aesthetics generated by aes}
 \item{data}{dataset used in this layer, if not specified uses plot dataset}
 \item{geom}{geometric used by this layer}
 \item{position}{position adjustment used by this layer}
 \item{quantiles}{conditional quantiles of y to calculate and display}
 \item{formula}{formula relating y variables to x variables}
 \item{method}{NULL}
 \item{na.rm}{NULL}
 \item{...}{other arguments}
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot2/stat_quantile.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
msamp <- movies[sample(nrow(movies), 1000), ]
m <- ggplot(msamp, aes(y=rating, x=year)) + geom_point() 
m + stat_quantile()
m + stat_quantile(quantiles = 0.5)
m + stat_quantile(quantiles = seq(0.1, 0.9, by=0.1))

# Doesn't work.  Not sure why.
# m + stat_quantile(method = rqss, formula = y ~ qss(x), quantiles = 0.5)

# Add aesthetic mappings
m + stat_quantile(aes(weight=votes))

# Change scale
m + stat_quantile(aes(colour = ..quantile..), quantiles = seq(0.05, 0.95, by=0.05))
m + stat_quantile(aes(colour = ..quantile..), quantiles = seq(0.05, 0.95, by=0.05)) +
  scale_colour_gradient2(midpoint=0.5, low="green", mid="yellow", high="green")

# Set aesthetics to fixed value
m + stat_quantile(colour="red", size=2, linetype=2)

# Use qplot instead
qplot(year, rating, data=movies, geom="quantile")

}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
