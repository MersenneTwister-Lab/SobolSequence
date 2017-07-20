##' Sobol Sequence
##'
##' R implementation of S. Joe and F. Y. Kuo,
##' "Constructing Sobol sequences with better two-dimensional projections",
##' SIAM J. Sci. Comput. 30, 2635-2654 (2008).
##'
##' The implementation is based on the data file new-joe-kuo-6.21201
##' <http://web.maths.unsw.edu.au/~fkuo/sobol/>.
##'
##' Porting to R by Mutsuo Saito.
##' The R version does not returns cordinate value zero,
##' but returns value very near to zero, 2^-64.
##'
##'@section Acknowledgments:
##' I, Mutsuo Saito, wish to thank Frances Kuo and Stephen Joe for their research,
##' and agreement to use thier source code.
##'
##' The development of this R code is partially supported by JST CREST.
##'
##'@examples
##' srange <- sobolSequence.dimMinMax()
##' points <- sobolSequence.points(dim=srange[1], count=10000)
##' points <- sobolSequence.points(dim=srange[1], count=10000, digitalShift=TRUE)
##'@section Reference:
##' S. Joe and F. Y. Kuo,
##' "Constructing Sobol sequences with better two-dimensional projections",
##' SIAM J. Sci. Comput. 30, 2635-2654 (2008).
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
##'@param dim dimention.
##'@return supportd maximum number of points.
##'@export
sobolSequence.maxCount <- function(dim) {
    return(2^31)
}

##' get points from SobolSequence
##'
##' This R version does not returns cordinate value zero,
##' but returns value very near to zero, 2^-64.
##'@param dim dimention.
##'@param count number of points.
##'@param digitalShift use digital shift or not.
##'@return matrix of points where every row contains dimR dimensional point.
##'@export
sobolSequence.points <- function(dim,
                                 count,
                                 digitalShift = FALSE) {
  smax = sobolSequence.dimMinMax()
  if (dim < smax[1] || dim > smax[2]) {
    stop(sprintf("dim should be an integer %d <= dim <= %d", smax[1], smax[2]))
  }
  dimF2 = max(10, ceiling(log2(count)))
  fname = system.file("extdata",
                       "new-joe-kuo-6.21201",
                       package = "SobolSequence")
  if (digitalShift) {
    sv <- runif(2*dim, min=-2^31, max=2^31-1)
  } else {
    sv <- numeric(1)
  }
#  print(sv)
  return(rcppSobolPoints(fname, dim, dimF2, count, sv))
}
