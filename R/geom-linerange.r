GeomLinerange <- proto(Geom, {
  objname <- "linerange"
  desc <- "An interval represented by a vertical line"

  seealso <- list(
    "geom_errorbar" = "error bars",
    "geom_pointrange" = "range indicated by straight line, with point in the middle",
    "geom_crossbar" = "hollow bar with middle indicated by horizontal line",
    "stat_summary" = "examples of these guys in use",
    "geom_smooth" = "for continuous analog"
  )
  
  default_stat <- function(.) StatIdentity
  default_aes <- function(.) aes(colour = "black", size=0.5, linetype=1, alpha = 1)
  guide_geom <- function(.) "path"
  required_aes <- c("x", "ymin", "ymax")

  draw <- function(., data, scales, coordinates, ...) {
    munched <- coordinates$transform(data, scales)
    ggname(.$my_name(), GeomSegment$draw(transform(data, xend=x, y=ymin, yend=ymax), scales, coordinates, ...))
  }

  icon <- function(.) segmentsGrob(c(0.3, 0.7), c(0.1, 0.2), c(0.3, 0.7), c(0.7, 0.95))
  
  examples <- function(.) {
    # Generate data: means and standard errors of means for prices
    # for each type of cut
    dmod <- lm(price ~ cut, data=diamonds)
    cuts <- data.frame(cut=unique(diamonds$cut), predict(dmod, data.frame(cut = unique(diamonds$cut)), se=T)[c("fit","se.fit")])
    
    qplot(cut, fit, data=cuts)
    # With a bar chart, we are comparing lengths, so the y-axis is 
    # automatically extended to include 0
    qplot(cut, fit, data=cuts, geom="bar")
    
    # Display estimates and standard errors in various ways
    se <- ggplot(cuts, aes(cut, fit, 
      ymin = fit - se.fit, ymax=fit + se.fit, colour = cut))
    se + geom_linerange()
    se + geom_pointrange()
    se + geom_errorbar(width = 0.5)
    se + geom_crossbar(width = 0.5)

    # Use coord_flip to flip the x and y axes
    se + geom_linerange() + coord_flip()
  }  
})
