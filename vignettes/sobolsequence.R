## ------------------------------------------------------------------------
library(SobolSequence)
sobolSequence.dimMinMax()

## ------------------------------------------------------------------------
sobolSequence.maxCount(10)

## ------------------------------------------------------------------------
s <- 4
c <- 1000
mat <- sobolSequence.points(dim=s, count=c)
mat[1,]

## ------------------------------------------------------------------------
s <- 4
c <- 1000
mat <- sobolSequence.points(dim=s, count=c, digitalShift=TRUE)
mat[1,]

