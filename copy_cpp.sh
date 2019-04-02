#!/bin/bash

rm -rf include
mkdir -p include

cp -r vendor/include/crc32c      include
cp crc32c_config.h               include/crc32c
cp vendor/LICENSE                include
cp vendor/src/crc32c.cc          include
cp vendor/src/crc32c_arm64.*     include
cp vendor/src/crc32c_arm64*.h    include
cp vendor/src/crc32c_sse42.*     include
cp vendor/src/crc32c_sse42*.h    include
cp vendor/src/crc32c_portable.cc include
cp vendor/src/crc32c_round_up.h  include
cp vendor/src/crc32c_internal.h  include
cp vendor/src/crc32c_prefetch.h  include
cp vendor/src/crc32c_read_le.h   include
