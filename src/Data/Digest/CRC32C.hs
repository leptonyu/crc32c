module Data.Digest.CRC32C(
    crc32c
  , crc32c_update
  ) where

import           Data.ByteString.Internal    (ByteString (..))
import           Data.Word
import           Foreign.C.Types
import           Foreign.ForeignPtr.Unsafe
import           Foreign.Ptr

crc32c :: ByteString -> Word32
crc32c (PS p o l) = fromIntegral $ lib_crc32c_value (unsafeForeignPtrToPtr p `plusPtr` o) (fromIntegral l)

crc32c_update :: Word32 -> ByteString -> Word32
crc32c_update hash (PS p o l) = fromIntegral $ lib_crc32c_extend (CUInt hash) (unsafeForeignPtrToPtr p `plusPtr` o) (fromIntegral l)

foreign import ccall "crc32c/crc32c.h crc32c_extend"
  lib_crc32c_extend :: CUInt -> Ptr CUChar -> CSize -> CUInt

foreign import ccall "crc32c/crc32c.h crc32c_value"
  lib_crc32c_value :: Ptr CUChar -> CSize -> CUInt
