#include <inttypes.h>
#include <lua.h>
#include <lauxlib.h>
#include "murmurhash3.h"

#define OUT_LEN 16
static unsigned char out[OUT_LEN];

static int
lhash32(lua_State *L) {
    size_t len;
    const char *str = luaL_checklstring(L, 1, &len);
    uint32_t out_int;
    MurmurHash3_x86_32(str, len, luaL_optinteger(L, 2, 0), &out_int);
    lua_pushinteger(L, out_int);
    return 1;
}

static int
lhash128(lua_State *L) {
    size_t len;
    const char *str = luaL_checklstring(L, 1, &len);
    MurmurHash3_x86_128(str, len, luaL_optinteger(L, 2, 0), out);
    lua_pushlstring(L, (const char *)out, OUT_LEN);
    return 1;
}

static int
lhash128_x64(lua_State *L) {
    size_t len;
    const char *str = luaL_checklstring(L, 1, &len);
    MurmurHash3_x64_128(str, len, luaL_optinteger(L, 2, 0), out);
    lua_pushlstring(L, (const char *)out, OUT_LEN);
    return 1;
}

LUAMOD_API int
luaopen_lmurmurhash3(lua_State *L) {
    luaL_checkversion(L);
    luaL_Reg l[] = {
        { "hash32", lhash32 },
        { "hash128", lhash128 },
        { "hash128_x64", lhash128_x64 },
        { NULL, NULL },
    };
    luaL_newlib(L, l);
    return 1;
}
