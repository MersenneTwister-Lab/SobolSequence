#include <Rcpp.h>
#include "DigitalNet.h"

// [[Rcpp::plugins(cpp11)]]

using namespace std;
using namespace Rcpp;
using namespace DigitalNetNS;

// [[Rcpp::export(rng = false)]]
NumericMatrix rcppSobolPoints(std::string filename,
                              int dimR,
                              int dimF2,
                              int count,
                              NumericVector shiftVector)
{
    digital_net_id id = SOBOL;
    DigitalNet<uint64_t> digitalNet(filename, id, dimR, dimF2);
    if (shiftVector.length() == 2 * dimR) {
#if defined(RDEBUG)
        Rcout << "shiftVector.length = " << shiftVector.length() << endl;
#endif
        IntegerVector iv = as<IntegerVector>(shiftVector);
#if defined(IN_CRAN)
        uint64_t * shifts = new uint64_t[dimR];
#else
        uint64_t shifts[dimR];
#endif
        for (int i = 0; i < dimR; i++) {
#if defined(RDEBUG)
            Rcout << "shiftVector[" << (2*i) << "] = "
                  << iv[2*i] << endl;
            Rcout << "shiftVector[" << (2*i+1) << "] = "
                  << iv[2*i+1] << endl;
#endif
            uint64_t x = static_cast<uint32_t>(iv[2 * i]);
            x = (x << 32) | static_cast<uint32_t>(iv[2 * i + 1]);
            shifts[i] = x;
        }
#if defined(RDEBUG)
        Rcout << "shifts:" << endl;
        for (int i = 0; i < dimR; i++) {
            Rcout << dec << i << ":" << hex << shifts[i] << endl;
        }
#endif
        digitalNet.setDigitalShift(shifts);
#if defined(IN_CRAN)
        delete[] shifts;
#endif
    }
    digitalNet.pointInitialize();
    //uint32_t cnt = 0;
    NumericMatrix mx(count, dimR);
    // assume that count <= 2^dimF2
    for (int i = 0; i < count; i++) {
        checkUserInterrupt();
        for (int j = 0; j < dimR; j++) {
            mx(i, j) = digitalNet.getPoint(j);
        }
        digitalNet.nextPoint();
    }
    return mx;
}
