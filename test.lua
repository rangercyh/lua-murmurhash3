local murmurhash3 = require("murmurhash3")

local test_case = {
    -- seed, str, hash32, hash128, hash128_64
    {
        0,
        "My hovercraft is full of eels.",
        2953494853,
        "ae86a1e36cba69e134d98b6a9cfa683c",
        "d1168c354de1e503cbcfd57edf86aee5",
    },
    {
        0,
        "我的气垫船装满了鳗鱼。",
        4193185573,
        "7c1d3b4ac263275f1f55d5d62f921e5f",
        "84b31eec373f4d452575d0e37db46fab",
    },
    {
        0,
        "My 🚀 is full of 🦎.",
        1818098979,
        "5fd816e678f6e7fe9961b4da0fb95b5b",
        "dfc9c6581e3947d0509f042ec962decc",
    },

    {
        0x00,
        "",
        0,
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
    },
    {
        0x00,
        "hello",
        0x248bfa47,
        "a044242bf7de91dbb631db9ab631db9a",
        "029bbd41b3a7d8cb191dae486a901e5b",
    },
    {
        0x00,
        "hello, world",
        0x149bbb7f,
        "5c60218b1e8ab9b9833a2793c75759eb",
        "8ebc5e3a62ac2f344d41429607bcdc4c",
    },
    {
        0x00,
        "19 Jan 2038 at 3:14:07 AM",
        0xe31e8a70,
        "d40aea5c42ce288df01306b58cafcc38",
        "fcaf37b788599eb8cbb2310295c24f66",
    },
    {
        0x00,
        "The quick brown fox jumps over the lazy dog.",
        0xd5c48bfc,
        "9960bb6c5eedd67dbb0fbf2b557b629b",
        "c902e99e1f4899cde7b68789a3a15d69",
    },

    {
        0x01,
        "",
        0x514e28b7,
        "ecadc488b901d254b901d254b901d254",
        "b55cff6ee5ab10468335f878aa2d6251",
    },
    {
        0x01,
        "hello",
        0xbb4abcad,
        "84daa4eb2fb5591719bd107c19bd107c",
        "108daeadf5df8da735019020ef008912",
    },
    {
        0x01,
        "hello, world",
        0x6f5cb2e9,
        "943bdea997a3efdfd6d65d53d18bf032",
        "c625078408f8958b3b49bd2254ed9715",
    },
    {
        0x01,
        "19 Jan 2038 at 3:14:07 AM",
        0xf50e1f30,
        "c4317dbe8fc3160e4105b48175a490d1",
        "2f7bf9c8e99d922adba243af991da456",
    },
    {
        0x01,
        "The quick brown fox jumps over the lazy dog.",
        0x846f6a36,
        "d1b77111120f962bb5c68f2122308734",
        "da44971f172533fb5229725f2ab9f8aa",
    },

    {
        0x2a,
        "",
        0x087fcd5c,
        "b62c6dafba0cc895ba0cc895ba0cc895",
        "23851bfa7da72af0b9cb11da106601d1",
    },
    {
        0x2a,
        "hello",
        0xe2dbd2e1,
        "019a4f9cf6043405959b6f88959b6f88",
        "086faf60c9b3b8c47abcefb075b83423",
    },
    {
        0x2a,
        "hello, world",
        0x7ec7c6c2,
        "fce08bef3b18948032273574d4b866ea",
        "56a9ca97d76418b95061fe5aa539d1d5",
    },
    {
        0x2a,
        "19 Jan 2038 at 3:14:07 AM",
        0x58f745f6,
        "f424b25cd6f1b48415289bbb20ec1af8",
        "6a6b8cdceb198ffdf98fa00f31dc0fd3",
    },
    {
        0x2a,
        "The quick brown fox jumps over the lazy dog.",
        0xc02d1434,
        "fe6eab1161c24553a441aaef0bc5d89b",
        "f75ada9c653cf374f016f3ca91a8c74e",
    },
}

for _, v in ipairs(test_case) do
    assert(murmurhash3.hash32(v[2], v[1]) == v[3])
    assert(murmurhash3.hash128(v[2], v[1]) == v[4])
    assert(murmurhash3.hash128_x64(v[2], v[1]) == v[5])
end
