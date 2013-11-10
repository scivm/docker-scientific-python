mkdir -p /root/src
cd /root/src/
wget http://www.netlib.org/lapack/lapack.tgz
tar xzf lapack.tgz
cd lapack-*/
cp INSTALL/make.inc.gfortran make.inc          # on Linux with lapack-3.2.1 or newer
sed -i 's/OPTS     = -O2/OPTS = -O2 -fPIC -m64/g' make.inc
sed -i 's/NOOPT    = -O0/NOOPT = -O0 -fPIC -m64/g' make.inc
make lapacklib
make clean
cp liblapack.a /usr/local/lib
echo "Created liblapack.a in /usr/local/lib"
export LAPACK=/usr/local/lib/liblapack.a
