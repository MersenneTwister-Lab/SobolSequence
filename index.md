R package: Sobol sequences with better two-dimensional projections
==================================================================

Mutsuo Saito ported
"Constructing Sobol sequences with better two-dimensional projections"
by Stephen Joe and Frances Y. Kuo to R.

##Information
SobolSequence 1.0 is now available in CRAN.

##Link
- [Japanese Version](index-ja.html)
- [vignettes](sobolsequence.html)
- [GitHub Page](https://github.com/MersenneTwister-Lab/SobolSequence/)
- [This Page](https://mersennetwister-lab.github.io/SobolSequence/)

##Install
You can install the release packeage from CRAN.

### Install Develop version
- Windows Users need [Rtools](https://cran.r-project.org/bin/windows/Rtools/).
- Mac users need Xcode.

And then,

```
install.packages('devtools')
library('devtools')
install_github("MersenneTwister-Lab/SobolSequence", ref='develop')
```

##Download
### Release Version:

- Source Package: [SobolSequence_1.0.tar.gz](SobolSequence_1.0.tar.gz)
- OS X Binary Package: [SobolSequence_1.0.tgz](SobolSequence_1.0.tgz)
- Windows Binary Package: [SobolSequence_1.0.zip](SobolSequence_1.0.zip)

### Develop Version:

- Source Package: [SobolSequence_1.0.1.tar.gz](SobolSequence_1.0.1.tar.gz)
- OS X Binary Package: [SobolSequence_1.0.1.tgz](SobolSequence_1.0.1.tgz)
- Windows Binary Package: [SobolSequence_1.0.1.zip](SobolSequence_1.0.1.zip)
- [vignettes](v1_0_1/sobolsequence.html)

##Reference
- S. Joe and F. Y. Kuo,
"Constructing Sobol sequences with better two-dimensional projections",
SIAM J. Sci. Comput. 30, 2635-2654 (2008).
[Constructing Sobol Sequences with Better Two-Dimensional Projections](http://epubs.siam.org/doi/10.1137/070709359)
- Web Page:
[Sobol sequence generator](http://web.maths.unsw.edu.au/~fkuo/sobol/)
- Data File:
[new-joe-kuo-6.21201](http://web.maths.unsw.edu.au/~fkuo/sobol/new-joe-kuo-6.21201)
- Source File:
[sobol.cc](http://web.maths.unsw.edu.au/~fkuo/sobol/sobol.cc)