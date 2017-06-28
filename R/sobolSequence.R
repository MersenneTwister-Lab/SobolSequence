##' Sobol Sequence
##'
##' Sobol sequences with better two-dimensional projections.
##'
##'@name SobolSequence-package
##'@aliases SobolSequence-package sobolsequence
##'@docType package
##'@import Rcpp
##'@importFrom stats runif
##'@useDynLib SobolSequence
NULL

##' get minimum and maximum dimension number of Sobol Sequence
##'
##'@return supportd minimum and maximum dimension number.
##'@export
sobolSequence.dimMinMax <- function() {
    return(c(2, 21201))
}

##' get minimum and maximum F2 dimension number.
##'
##'@param dimR dimention.
##'@return supportd minimum and maximum F2 dimension number for specified digitalNet.
##'@export
sobolSequence.dimF2MinMax <- function(dimR) {
    return(c(10, 31))
}

##' get points from SobolSequence
##'
##'@param dimR dimention.
##'@param dimF2 F2-dimention of each element.
##'@param count number of points.
##'@param digitalShift use digital shift or not.
##'@return matrix of points where every row contains dimR dimensional point.
##'@export
sobolSequence.points <- function(dimR,
                              dimF2 = 10,
                              count,
                              digitalShift = FALSE) {
  smax = sobolSequence.dimMinMax()
  if (dimR < smax[1] || dimR > smax[2]) {
    stop(sprintf("dimR should be an integer %d <= dimR <= %d", smax[1], smax[2]))
  }
  if (missing(dimF2)) {
    dimF2 = max(dimF2, ceiling(log2(count)))
  }
  mmax = sobolSequence.dimF2MinMax(dimR)
  if (dimF2 < mmax[1] || dimF2 > mmax[2]) {
    stop(sprintf("dimD2 should be an integer %d <= dimF2 <= %d", mmax[1], mmax[2]))
  }
  fname = system.file("extdata",
                       "new-joe-kuo-6.21201",
                       package = "SobolSequence")
  if (digitalShift) {
    sv <- runif(2*dimR, min=-2^31, max=2^31-1)
  } else {
    sv <- numeric(1)
  }
#  print(sv)
  return(rcppSobolPoints(fname, dimR, dimF2, count, sv))
}

