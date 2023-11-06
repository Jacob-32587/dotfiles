sudo apt-get install libssl-dev
sudo apt install build-essential libtool autoconf unzip wget


version=3.27
build=0
## don't modify from here
mkdir ~/temp
cd ~/temp
wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz
tar -xzvf cmake-$version.$build.tar.gz
cd cmake-$version.$build/

./bootstrap
make -j$(nproc)
sudo make install