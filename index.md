モンテカルロ及び準モンテカルロ法による数値積分
----------------------------------

このパッケージはモンテカルロ法による数値積分関数**mcint**および準モンテカルロ法
による数値積分関数**qmcint**を提供する。

準モンテカルロ法で使用できる三種類の超一様分布列があらかじめ定義されている。
それはWAFOM値の低い Niederreiter-Xing 点集合とSobol 点集合である。

被積分関数は, ユーザーが定義する必要があるが, 数値のベクトルを引数として
受け取り, 数値を返す必要がある。
被積分関数に渡される点は $(0, 1)^s$ の範囲の数になる。

まず, 被積分関数の例を挙げる。これは原点を中心とする半径1の単位n次元超球の体積を求める関数である。

```{.r}
library(rmcqmcint)
unit.nsphere <- function(point) {
    if (sqrt(sum(point^2)) <= 1.0) {
        r <- 1.0
    } else {
        r <- 0.0
    }
    return(r)
}
```

例1:

qmc によりデフォルトの超一様分布列を使って4次元超球の体積を求める。

```{.r}
rs <- qmcint(integrand=unit.nsphere, N=100, s=4)
```

この結果は以下のようになる。

```{.r}
rs$mean
## [1] 0.3088086
rs$absError
## [1] 0.001195585
1 / 2 * pi^2 / 16 # to compare true value.
## [1] 0.3084251
```

例2:

qmcによってWAFOM値の小さいSobol点集合を使い, 5次元単位超球の体積を計算する。

```{.r}
rs <- qmcint(integrand=unit.nsphere, N=100, s=5, digitalNetID = 2)
```

この結果は以下のようになる。

```{.r}
rs$mean
## [1] 0.1654004
rs$absError
## [1] 0.001557645
8 / 15 * pi^2 / 32 # to compare true value.
## [1] 0.1644934
```

例3:

4次元単位超球の体積をモンテカルロ法によって求める。

```{.r}
rs <- qmcint(integrand=unit.nsphere, N=100, s=4)
```

この結果はおおむね以下のようになるだろう。

```{.r}
rs$mean
## [1] 0.3088086
rs$absError
## [1] 0.001195585
1 / 2 * pi^2 / 16 # to compare true value.
## [1] 0.3084251
```

例4:

5次元単位超球の体積をモンテカルロ法によって求める。

```{.r}
rs <- qmcint(integrand=unit.nsphere, N=100, s=5)
```

この結果はおおむね以下のようになるだろう。

```{.r}
rs$mean
## [1] 0.1642773
rs$absError
## [1] 0.001248333
8 / 15 * pi^2 / 32 # to compare true value.
## [1] 0.1644934
```


超一様分布点集合を直接得ることもできる。
超一様分布列は次のどれかを指定する。

- 1:Niederreiter-Xing low WAFOM
- 2:Sobol low wafom

使用可能な点集合の次元を取得する。

```{.r}
digitalnet.dimMinMax(digitalNetID=1)
## [1]  4 32
```

上記範囲内の次元を指定して、使用可能なF2次元を取得する。F2次元がmなら$2^m$の
点が利用できる。

```{.r}
digitalnet.dimF2MinMax(digitalNetID=1, dimR=10)
## [1] 10 18
```

点集合を取得する。返却値は１行ごとに一つの点を表すベクトルになっている。
返却する点集合は次元をsとすると$(0, 1)^s$内の点である。最小の座標値は
$2^{-64}$であり、取り得る最大の座標値は$1-2^{-53}$である。

```{.r}
digitalnet.points(digitalNetID=1, dimR=10, dimF2=12, count=2^12)
```

デジタルシフトを指定すると乱数を使用してデジタルシフトした点集合が得られる。

```{.r}
digitalnet.points(digitalNetID=1, dimR=10, dimF2=12, count=2^12,
                  digitalShift=TRUE)
```
