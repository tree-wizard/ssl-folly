CC=clang-6.0
CXX=clang++-6.0


FOLLY=/root/proxygen/proxygen/folly

all: Fuzzer

clean:
	rm -rf Fuzzer

Fuzzer: fuzzer.cpp

	$(CXX) -o fuzzer fuzzer.cpp -I$(FOLLY)/include $(FOLLY)/_build/libfolly.so -g -lcrypto -fsanitize=fuzzer,undefined -lfolly -lboost_system -lglog