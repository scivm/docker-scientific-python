mkdir -p /root/src/
cd /root/src/
wget http://www.netlib.org/blas/blas.tgz
tar xzf blas.tgz
cd BLAS

## NOTE: The selected fortran compiler must be consistent for BLAS, LAPACK, NumPy, and SciPy.
gfortran -O3 -std=legacy -m64 -fno-second-underscore -fPIC -c *.f    # with gfortran

# Continue below irrespective of compiler:
ar r libfblas.a *.o
ranlib libfblas.a
rm -rf *.o
cp libfblas.a /usr/local/lib
echo "Created libfblas in /usr/local/lib"
# cleanup
rm -r -f /root/src
