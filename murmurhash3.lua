local murmurhash3 = require("lmurmurhash3")

local sbyte = string.byte
local sgsub = string.gsub
local sformat = string.format

local function convert_to_hex(bytes)
    return (sgsub(bytes, ".", function(c)
        return sformat("%02x", sbyte(c))
    end))
end

local M = {}

function M.hash32(str, seed)
    return murmurhash3.hash32(str, seed)
end

function M.hash128(str, seed, raw)
    local bytes = murmurhash3.hash128(str, seed)
    return raw and bytes or convert_to_hex(bytes)
end

function M.hash128_x64(str, seed, raw)
    local bytes = murmurhash3.hash128_x64(str, seed)
    return raw and bytes or convert_to_hex(bytes)
end

return M
