# Folly Macaddr Dockerfile

FROM ubuntu:latest
RUN apt-get update --fix-missing
RUN apt-get --yes install git tree apt-utils
RUN apt-get update
RUN apt-get --yes install wget vim git tree gnupg1 zlib1g-dev make

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key > key 
RUN apt-key add key
RUN apt-get update
RUN apt-get --yes install clang-6.0 lldb-6.0 lld-6.0 libfuzzer-6.0-dev

ENV CC clang-6.0
ENV CXX clang++-6.0

RUN apt-get install --yes g++     cmake     libboost-all-dev     libevent-dev     libdouble-conversion-dev     libgoogle-glog-dev     libgflags-dev     libiberty-dev     liblz4-dev     liblzma-dev     libsnappy-dev     make     zlib1g-dev     binutils-dev     libjemalloc-dev     libssl-dev     pkg-config     libsodium-dev

RUN git clone https://github.com/facebook/proxygen /root/proxygen/

RUN git clone https://github.com/xxyyx/ssl-folly /root/ssl-folly
RUN chmod +777 /root/ssl-folly/deps.sh
RUN mv /root/ssl-folly/deps.sh /root/proxygen/proxygen/deps.sh
RUN git clone https://github.com/facebook/folly /root/proxygen/proxygen/folly
RUN mv /root/ssl-folly/FollyConfigChecks.cmake /root/proxygen/proxygen/folly/CMake/FollyConfigChecks.cmake

RUN mv /root/ssl-folly/replacements/Subprocess.cpp /root/proxygen/proxygen/folly/folly/Subprocess.cpp
RUN mv /root/ssl-folly/replacements/OpenSSLCertUtils.cpp /root/proxygen/proxygen/folly/folly/ssl/OpenSSLCertUtils.cpp

#RUN ./deps.sh
# RUN ldconfig

