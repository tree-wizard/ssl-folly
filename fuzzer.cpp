#include <folly/ssl/OpenSSLCertUtils.h>
#include <folly/String.h>

extern "C" int LLVMFuzzerTestOneInput(const char *data, size_t size) {

      folly::StringPiece bin1(data, size);
      folly::ssl::OpenSSLCertUtils::readStoreFromBuffer(bin1);
        return 0;
}
