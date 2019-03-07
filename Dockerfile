# Folly SSL Dockerfile

FROM ubuntu:latest
RUN apt-get update --fix-missing
RUN apt-get --yes install git tree apt-utils
RUN apt-get update
RUN apt-get --yes install wget vim git tree gnupg1 zlib1g-dev make

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key > key 
RUN apt-key add key
RUN apt-get update
RUN apt-get --yes install clang-7 lldb-7 lld-7 libfuzzer-7-dev

ENV CC clang-7
ENV CXX clang++-7

RUN apt-get install --yes g++     cmake     libboost-all-dev     libevent-dev     libdouble-conversion-dev     libgoogle-glog-dev     libgflags-dev     libiberty-dev     liblz4-dev     liblzma-dev     libsnappy-dev     make     zlib1g-dev     binutils-dev     libjemalloc-dev     libssl-dev     pkg-config     libsodium-dev

#download repos
RUN git clone https://github.com/facebook/proxygen /root/proxygen/
RUN git clone https://github.com/facebook/folly /root/proxygen/proxygen/folly

#download and replace files.
RUN git clone https://github.com/xxyyx/ssl-folly /root/ssl-folly
RUN chmod +777 /root/ssl-folly/replacements/deps.sh

RUN mv /root/ssl-folly/replacements/deps.sh /root/proxygen/proxygen/deps.sh
RUN mv /root/ssl-folly/replacements/FollyConfigChecks.cmake /root/proxygen/proxygen/folly/CMake/FollyConfigChecks.cmake

RUN mv /root/ssl-folly/replacements/Subprocess.cpp /root/proxygen/proxygen/folly/folly/Subprocess.cpp
RUN mv /root/ssl-folly/replacements/OpenSSLCertUtils.cpp /root/proxygen/proxygen/folly/folly/ssl/OpenSSLCertUtils.cpp

#RUN ./deps.sh
# RUN ldconfig

