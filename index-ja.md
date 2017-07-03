R package: 2次元射影のよいSobol sequences
=====================================

Stephen Joe と Frances Y. Kuo による
"Constructing Sobol sequences with better two-dimensional projections"
を斎藤睦夫がRに移植したもの。

##注意
いまのところ、このプロジェクトはまったく実験的なものです。

##リンク

- [英語版](index.html)
- [ビニエット](sobolsequence-ja.html)
- [GitHub Page](https://github.com/MersenneTwister-Lab/SobolSequence/)
- [このページ](https://mersennetwister-lab.github.io/SobolSequence/)

##インストール
まず、

- Windows利用者は[Rtools](https://cran.r-project.org/bin/windows/Rtools/)を
インストールしておく必要がある。
- Mac 利用者はXcodeをインストールしておく必要があるかもしれない。

その後、以下のようにしてこのパッケージをRにインストールすることができる。

```
install.packages('devtools')
library('devtools')
install_github('MersenneTwister-Lab/SobolSequence')
```

##やり直し
上記の方法でうまくいかないときは、ダウンロードしてインストールする方法を試してください。

- Source Package: [SobolSequence_1.0.tar.gz](SobolSequence_1.0.tar.gz)
- OS X Binary Package: [SobolSequence_1.0.tgz](SobolSequence_1.0.tgz)
- Windows Binary Package: [SobolSequence_1.0.zip](SobolSequence_1.0.zip)

##参照
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