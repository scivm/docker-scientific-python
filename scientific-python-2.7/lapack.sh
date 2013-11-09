mkdir -p /root/src
cd /root/src/
wget http://www.netlib.org/lapack/lapack.tgz
tar xzf lapack.tgz
cd lapack-*/
cp INSTALL/make.inc.gfortran make.inc          # on Linux with lapack-3.2.1 or newer
make lapacklib
make clean
cp liblapack.a /usr/local/lib
export LAPACK=/usr/local/lib/liblapack.a
