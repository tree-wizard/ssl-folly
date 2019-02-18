#include <folly/ssl/OpenSSLCertUtils.h>
#include <folly/Format.h>
#include <folly/Range.h>
#include <folly/String.h>
#include <folly/container/Enumerate.h>
#include <folly/portability/OpenSSL.h>
#include <folly/ssl/Init.h>
#include <folly/ssl/OpenSSLPtrTypes.h>



extern "C" int LLVMFuzzerTestOneInput(const char *data, size_t size) {

  // const char* kTestCa = "/root/ssl/ca-cert.pem";

  folly::ssl::OpenSSLCertUtils::readStoreFromFile(data);


        return 0;
}