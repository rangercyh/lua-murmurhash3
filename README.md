# lua-murmurhash3

lua wrapper for [murmurhash3](https://github.com/aappleby/smhasher/wiki/MurmurHash3)

murmurhash3 code is according to [smhasher murmurhash3](https://github.com/rurban/smhasher/blob/master/MurmurHash3.cpp) 

# use

```lua
local murmurhash3 = require("murmurhash3")

-- murmurhash3.hash32(str, [seed])
-- hash a str to x86 32 bit integer, return the integer.
-- seed is optional, default value is 0.
murmurhash3.hash32("我的气垫船装满了鳗鱼。")  -- 4193185573

-- murmurhash3.hash128(str, [seed], [raw])
-- hash a str to x86 128 bit binary, return the hexadecimal bytes string.
-- seed default value is 0.
-- raw is optional, if pass true value, return the original bytes string.
murmurhash3.hash128("My 🚀 is full of 🦎.")  -- "5fd816e678f6e7fe9961b4da0fb95b5b"

-- murmurhash3.hash128_x64(str, [seed], [raw])
-- hash a str to x64 128 bit binary, return the hexadecimal bytes string.
-- seed default value is 0.
-- raw is optional, if pass true value, return the original bytes string.
murmurhash3.hash128_x64("hello", 1)  -- "108daeadf5df8da735019020ef008912"
```

# tip

I use unsigned char to pass from c to lua and convert the binary to hexadecimal bytes string in lua code.

So the sequence of the bytes is different from other lib like [go native murmur3](https://github.com/spaolacci/murmur3/blob/master/murmur_test.go#L17) when they use the binary bits convert to internal integer type.

The original bytes string can be convert to integer in either endian you choose, I put a example in the [test case](test.lua#L142).

If you want to do some compatible work with the other implementation, you can get the raw bytes string and change the representation yourself refer to my test example.
